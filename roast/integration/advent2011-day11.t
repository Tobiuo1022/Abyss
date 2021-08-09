# http://perl6advent.wordpress.com/2011/12/11/privacy-and-oop/
use v6;
use Test;
plan 9;

class Trusty {...}
class Untrusty {...}

class Order {
    trusts Trusty;

    my class Item {
	has $.name;
	has $.price;
    }

    has Item @!items;

    method add_item($name, $price) {
	@!items.push(Item.new(:$name, :$price))
    }

    method discount() {
	self!compute_discount()
    }

    method total() {
	self!compute_subtotal() - self!compute_discount();
    }

    method !compute_subtotal() {
	[+] @!items>>.price
    }

    method !compute_discount() {
	my $sum = self!compute_subtotal();
	if $sum >= 1000 {
	    $sum * 0.15
	}
	elsif $sum >= 100 {
	    $sum * 0.1
	}
	else {
	    0
	}
    }

    method this-should-compile {EVAL 'return 1; self!compute_subtotal() - self!compute_discount()'}
    method but-this-shouldnt {EVAL 'return 1; self!compite_subtotal() - self!compute_discount()'}
}

my $order = Order.new;
$order.add_item('Widget', 10.99);
$order.add_item('Gadget', 25.50);
$order.add_item('Gizmo', 49.00);

lives-ok {$order.this-should-compile},'order total sanity';
throws-like {$order.but-this-shouldnt},
  X::Method::NotFound,
  'order total with typo';
lives-ok {EVAL '$order.discount'}, 'public method sanity';
throws-like {EVAL '$order!compute_discount'},
  X::Method::Private::Unqualified,
  'private method sanity';
throws-like {EVAL '$o!Order::compute_discount'},
  X::Method::Private::Permission,
  'private method sanity';

# "...a class may choose to trust another one (or, indeed, any other package)
# to be able to call its private methods. Critically, this is the decision of
# the class itself"

class Trusty is Order {
    method try-pub {self.discount}
    method try-priv {self!Order::compute_subtotal() - self!Order::compute_discount()}
}

my $trusty = Trusty.new;
$trusty.add_item('Contraption', 90.00);
$trusty.add_item('Doo-Hicky', 12.50);

lives-ok {$trusty.try-pub}, 'inheritance public method, (trusting)';
lives-ok {$trusty.try-priv}, 'inheritance private method, (trusting)';

class Untrusty is Order {
    method try-pub {self.discount}
    method try-priv {EVAL 'self!Order::compute_subtotal() - self!Order::compute_discount()'}
}

my $untrusty = Untrusty.new;
$untrusty.add_item('Contrivance', 60.00);
$untrusty.add_item('Apparatus', 50.00);

lives-ok {$untrusty.try-pub}, 'inheritance public method, (untrusting)';
throws-like {$untrusty.try-priv},
  X::Method::Private::Permission,
  'inheritance private method, (untrusting)';


# vim: expandtab shiftwidth=4

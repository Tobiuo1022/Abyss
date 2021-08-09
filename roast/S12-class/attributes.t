use v6;

use Test;

plan 39;

# L<S12/Fancy method calls/"For a call on your own private method">

class Counter {
    has $!x;
    method init { $!x = 41 }
    method get { $!x }
    method inc { $!x++ }
}

my $c = Counter.new();
dies-ok { $c.x }, 'no public accessor for private attribute';
$c.init();
is($c.get(), 41, 'can assign and get from within the class');
$c.inc();
is($c.get(), 42, 'can auto-increment an attribute');

{
    class WithAlias {
        has $x;
        method set($a) { $x = $a }
        method get { $!x }
    }

    my $wa = WithAlias.new();
    $wa.set(99);
    is($wa.get, 99, 'has with no twigil creates alias');
}

{
    class ManyTest {
        has ($a, $b);
        has ($.c, $.d);
        has ($!e, $!f);
        submethod BUILD(:$!a, :$!b, :$!c, :$!d, :$!e, :$!f) { }
        method t1 {
            $a + $b
        }
        method t2 {
            $!a + $!b
        }
        method t3 {
            $!e + $!f
        }
    }

    my $m = ManyTest.new(a => 1, b => 2, c => 3, d => 4, e => 5, f => 6);
    is($m.c, 3, 'list attribute declaration of publics works');
    is($m.d, 4, 'list attribute declaration of publics works');
    is($m.t1, 3, 'list attribute declaration of alias works');
    is($m.t2, 3, 'list attribute declaration of alias works');
    is($m.t3, 11, 'list attribute declaration of privates works');
}

class Foo {
    has %.bar is rw;
    method set_bar {
        %.bar<a> = 'baz';
    }
}
my $foo = Foo.new;
isa-ok($foo.bar, Hash,    'hash attribute initialized');
$foo.set_bar();
is($foo.bar<a>, 'baz',    'hash attribute initialized/works');
my %s = $foo.bar;
is(%s<a>, 'baz',          'hash attribute initialized/works');
$foo.bar<b> = 'wob';
is($foo.bar<b>, 'wob',    'hash attribute initialized/works');

class Bar {
    has @.bar is rw;
    method set_bar {
        @.bar[0] = 100;
        @.bar[1] = 200;
    }
}
my $bar = Bar.new;
isa-ok($bar.bar.WHAT, Array, 'array attribute initialized');
$bar.set_bar();
is($bar.bar[0], 100,       'array attribute initialized/works');
is($bar.bar[1], 200,       'array attribute initialized/works');
my @t = $bar.bar;
is(@t[0], 100,             'array attribute initialized/works');
is(@t[1], 200,             'array attribute initialized/works');
$bar.bar[2] = 300;
is($bar.bar[2], 300,       'array attribute initialized/works');

# https://github.com/Raku/old-issue-tracker/issues/1630
{
    class RT73808 {
        has ($!a, $!b);
        method foo {
            $!a = 1;
            $!b = 3;
            return $!a + $!b;
        }
    }
    is RT73808.new.foo, 4,
        'Providing a list of attributes to a single "has" works';
}

# https://github.com/Raku/old-issue-tracker/issues/2322
throws-like q[
    class RT81718 {
        has $.bughunt is rw;
        sub bomb { "life is a $.bughunt" }
        method meta_bomb { "the good " ~ bomb() }
    }
], X::Syntax::NoSelf, 'no attr access for sub inside class';

# https://github.com/Raku/old-issue-tracker/issues/1741
{
    class A { };
    class B { has A $.foo .= new };
    isa-ok B.new.foo, A, 'class attribute can be initialized using .=';
}

# https://github.com/Raku/old-issue-tracker/issues/2921
{
    eval-lives-ok '(class A { has $.x }).new.x.HOW',
        "HOW on attributes lives, custom class";
    eval-lives-ok '(1/2).numerator.HOW',
        "HOW on attributes lives, builtin";
}

# https://github.com/Raku/old-issue-tracker/issues/2836
{
    eval-lives-ok q{
        my class A { state $b; }
    }, "No segfault on state variables";
}

# https://github.com/Raku/old-issue-tracker/issues/1758
# Note, lazy ranges autotruncate if they run off the end (including infinite),
# others not
{

    my @y=1,2,3;
    is-deeply( [@y], [ 1, 2, 3 ], 'Plain array' );
    is-deeply( [@y[1 .. +@y]], [ 2, 3, Any ], 'Array from 2-nd element to end+1, non-lazy' );
    is-deeply( [@y[lazy 1 .. +@y]], [ 2, 3 ], 'Array from 2-nd element to end+1, lazy' );
    is-deeply( [@y[1 ..^ +@y]], [ 2, 3 ], 'Array from 2-nd element to end' );

    class AB {
        has @.x;
        method aa {
            my @y=1,2,3;
            is-deeply( [@y[1 ..^ +@y]], [ 2, 3 ], 'Plain array in the method' );
            is-deeply( [@.x], [ 1, 2, 3 ], 'Array from 2-nd element to end+1 in the method' );
            is-deeply( [@.x[1 ..^ +@.x]], [ 2, 3 ], 'Array from 2-nd element to end in the method' );
        }
    };

    my AB $y.=new(:x(1,2,3));
    $y.aa;

}

# https://github.com/Raku/old-issue-tracker/issues/1854
{
    lives-ok { EVAL 'my class RT75858 { has $.x where 1 }' },
        'can use where clause on an attribute';
}

# https://github.com/Raku/old-issue-tracker/issues/3415
{
    my class RT122109 { has $.x where * > 0 };
    dies-ok { RT122109.new(:x(-42)) },
        'where clause on attributes is taken into account';
}

# https://github.com/Raku/old-issue-tracker/issues/2929
{
    class RT115310 { has @.a of int };
    my $foo = RT115310.new;
    $foo.a = 1,2,3;
    is $foo.a, (1,2,3), 'typed array attribute (1)';
    throws-like '$foo.a = 1,"b"', Exception, 'typed array attribute (2)';
}

# https://github.com/Raku/old-issue-tracker/issues/5735
{
    class RT129830 { has Int @.array; has Str %.hash };
    is
        RT129830.^attributes[0].type.gist,
        '(Positional[Int])',
        '.gist works on attribute types (1)';
    is
        RT129830.^attributes[1].type.gist,
        '(Associative[Str])',
        '.gist works on attribute types (2)';
}

# https://github.com/Raku/old-issue-tracker/issues/4875
{
    my class Foo::Bar {};
    my $o := my class { has Foo::Bar $.a .= new }.new;
    cmp-ok $o.a, '~~', Foo::Bar:D,
	      '.= able to initialize attributes with types that has `::` in name';
}

# vim: expandtab shiftwidth=4

use v6;

use Test;

=begin pod

We ought to be able to change a value when aliasing into it.

# L<S04/The C<for> statement/by including the is rw trait>

=end pod

plan 10;

{
    my %h = 1..4;
    lives-ok {
        for %h.values -> $v is rw { $v += 1 }
    }, 'aliases returned by %hash.values should be rw (1)';

    is %h<3>, 5, 'aliases returned by %hash.values should be rw (2)';
}

{
    my %h = 1..4;
    lives-ok {
        for %h.values <-> $v { $v += 1 }
    }, 'aliases returned by %hash.values should be rw (<->) (1)';

    is %h<3>, 5, 'aliases returned by %hash.values should be rw (<->) (2)';
}

{
    my @a = 1..4;
    lives-ok {
        for @a.values -> $v is rw { $v += 1 }
    }, 'aliases returned by @array.values should be rw (1)';

    is @a[2], 4, 'aliases returned by @array.values should be rw (2)';
}

{
    my $pair = (a => my $ = 42);
    lives-ok {
        for $pair.value -> $v is rw { $v += 1 }
    }, 'aliases returned by $pair.values should be rw (1)';

    is $pair.value, 43, 'aliases returned by $pair.values should be rw (2)';
}

{
    my $var  = 42;
    my $pair = (a => $var);
    lives-ok {
        for $pair.value -> $v is rw { $v += 1 }
    }, 'aliases returned by $pair.values should be rw (1)';

    is $pair.value, 43, 'aliases returned by $pair.values should be rw (2)';
}

# (currently this dies with "Can't modify constant item: VInt 2")

# vim: expandtab shiftwidth=4

use v6;

use Test;

=begin kwid

.isa() tests

These tests are specific to the .isa() which is attached to the
Raku Array "class". Which is actually @array.HOW.isa(), which
is actually just the normal OO .isa(). This test does not attempt
to test anything other than the "normal" behavior of @array.isa()

Further clarification of .isa() can be found here:

L<"http://www.nntp.perl.org/group/perl.perl6.language/20974">
L<S29/Any/=item isa/>

=end kwid

plan 11;

{ # invocant notation
    my @arr = <1 2 3 4>;

    ok(@arr.isa(Array), '... @arr is-a Array (invocant notation)');

    # check a failing case
    ok(!@arr.isa(Hash), '... @arr is-not-a Hash (invocant notation)');
}


{ # invocant notation
    my $arr_ref = <1 2 3 4>;

    # check a failing case
    nok($arr_ref.isa(Hash), '... $arr is-not-a Hash (invocant notation)');
}

# check error cases

{
    my @arr = <1 2 3 4>;
    throws-like 'isa(@arr, Array)', X::Undeclared::Symbols, 'no sub called isa()';
    dies-ok { @arr.isa() }, '... isa() with a single arg is a failing case (invocant notation)';

    dies-ok { @arr.isa(Array, Hash)  }, '... isa() with a extra args is a failing case (invocant notation)';
}

## some edge cases, and weirdness

{ # check .isa() on inline values

    ok([1, 2, 3, 4].isa(Array), '... [1, 2, 3, 4].isa("Array") works');
    ok(![1, 2, 3, 4].isa(Hash), '... [1, 2, 3, 4].isa("Hash") fail predicably');
}

class Thing {};
{
    my $thing = Thing.new();
    ok($thing.isa(Thing), '.isa named class');
}
class Thing::something {};
{
    my $thing = Thing::something.new();
    ok($thing.isa(Thing::something), '.isa named class with colons');
}

# R#2331
{
    role A { };
    nok A.new.isa(A),   'A punned role is not an isa of itself by type';
}

# vim: expandtab shiftwidth=4

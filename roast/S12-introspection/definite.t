use v6;

use Test;

plan 7;

=begin pod

Tests for .DEFINITE from L<S12/Introspection>.

=end pod

# L<S12/Introspection/"The DEFINITE macro">

is Int.DEFINITE, False, ".DEFINITE on type object";
is 42.DEFINITE, True,   ".DEFINITE on literal value";

my $x;
is $x.DEFINITE, False,  ".DEFINITE on undeclared variable";
$x = 'OMG THAT KANGAROO IS ON FIRE!!!11!';
is $x.DEFINITE, True,   ".DEFINITE on variable with value";

class C {
    method DEFINITE() { True }
}
is C.DEFINITE,     False, "Class declaring DEFINITE method doesn't influence .DEFINITE macro";
is C."DEFINITE"(), True,  "Quoting lets us call the method, however";  #OK Useless

lives-ok {
    my $a = 0;
    my Mu \a := $a;
    a.DEFINITE;
    a = 10;
}, "DEFINITE doesn't destroy containers";

# vim: expandtab shiftwidth=4

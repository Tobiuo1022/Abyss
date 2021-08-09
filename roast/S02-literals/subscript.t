use v6;

use Test;

plan 2;

{ # from t/03-operator.t, as noted by afbach on #perl6, 2005-03-06
    my @oldval  = (5, 8, 12);
    my @newval1 = (17, 15, 14); # all greater
    my @newval2 = (15, 7,  20); # some less some greater
    lives-ok({ all(@newval2) < any(@oldval); all(@newval1) > all(@oldval) }, "parses correctly, second statement is true");

    my %hash = ("foo", "bar");
    throws-like { EVAL '%hash <foo>; 1'},
      X::Comp,
      '%hash \s+ <subscript> doesnt parse';
};

# vim: expandtab shiftwidth=4

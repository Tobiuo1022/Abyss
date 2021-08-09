use v6;
use Test;
plan 5;

#L<S03/Smart matching/Any Str string equality>
{
    ok(!("foo" !~~ "foo"),  "!(foo ne foo)");
    ok(("bar" !~~ "foo"),   "bar ne foo)");
    ok  (4 ~~ '4'),         'string equality';
    ok !(4 !~~ '4'),        'negated string equality';
    ok  !(Mu ~~ ''),         'Mu !~~ ""';
}

# vim: expandtab shiftwidth=4

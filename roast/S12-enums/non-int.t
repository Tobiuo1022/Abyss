use v6;
use Test;
plan 6;

{
    my enum A (a => 'foo', b => 'bar');
    is a.Str, 'foo', 'stringy enum first value';
    is b.Str, 'bar', 'stringy enum first value';
}

throws-like 'my enum B (a => 1, b => "bar")', Exception,
             'mixed type enums are forbidden';

#?rakudo todo 'NYI'
eval-lives-ok 'my Cool enum C (a => 1, b => "bar")',
             '... unless that type covers both enum value types';

throws-like 'my Str enum D (a => 1)', Exception,
             'violating an explicit type constraint dies';

{
    my enum E ( a => 'x', 'b');
    is E::b.Str, 'y', 'Str enum correctly uses string-increment';
}

# vim: expandtab shiftwidth=4

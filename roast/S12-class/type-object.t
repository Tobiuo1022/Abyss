use v6;
use Test;

plan 6;

is Any.Str,     '',      'Any.Str is empty string';
is Any.Stringy, '',      'Any.Str is empty string';
is Any.gist,    '(Any)', 'Any.gist has those parens';

# maybe a bit too retrictive?
is Any.raku,    'Any',   'Any.raku does not have parens';

is Any.^name,   'Any',   '.^name';

isa-ok (class A { }).new, A, 'can instantiate return value of class declaration';

# vim: expandtab shiftwidth=4

use v6;

use Test;

plan 4;

# L<S02/Slangs/>

ok(defined($~MAIN),    '$~MAIN is defined');
ok(defined($~Quote),   '$~Quote is defined');
ok(defined($~Regex),   '$~Regex is defined');
ok(defined($~P5Regex), '$~P5Regex is defined');

# vim: expandtab shiftwidth=4

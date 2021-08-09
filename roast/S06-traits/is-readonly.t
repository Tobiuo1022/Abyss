use v6;
use Test;

plan 1;

# L<S06/"Parameter traits"/"=item is readonly">
# should be moved with other subroutine tests?

{
    my $a = 3;

    ok (try { VAR($a).defined }), ".VAR on a plain normal initialized variable returns true";
}

# vim: expandtab shiftwidth=4

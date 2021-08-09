# http://perl6advent.wordpress.com/2011/12/24/day-24-subs-are-always-better-in-multi-ples/
use v6;
use Test;
plan 8;

multi sub steve(Str $name) {
    return "Hello, $name";
}
 
multi sub steve(Int $number) {
    return "You are person number $number to use this sub!";
}

is steve("John"), "Hello, John", 'multi';
is steve(35), "You are person number 35 to use this sub!", 'multi';

# Advent post is checking a user defined sub against a built in.
# This just tests two user defined subs that have been declared
# at the same level.

my $unambiguous = q:to'--END--';
proto sub Slurp(|) { * }
multi sub Slurp($filename) {
    pass "Yum! $filename was tasty. Got another one?";
}
--END--

my $ambiguous = $unambiguous ~ q:to'--END--';
multi sub Slurp($filename) {
    fail "Yuck! $filename is no good!";
}
--END--

lives-ok { EVAL $unambiguous ~ 'Slurp('~$?FILE.raku~')' },
  'unambiguous multi - lives';
throws-like { EVAL $ambiguous   ~ 'Slurp('~$?FILE.raku~')' },
  X::Multi::Ambiguous,
  'ambiguous multi - dies';

class Present {
    has $.item;
    has $.iswrapped = True;
 
    method look() {
        if $.iswrapped {
            "It's wrapped.";
        }
        else {
            "A $.item!";
        }
    }
 
    method unwrap() {
        $!iswrapped = False;
    }
}

multi sub open(Present $present) {
    $present.unwrap;
    pass "You unwrap the present and find...!";
}

my $gift = Present.new(:item("sock"));
is $gift.look, "It's wrapped.", "It's wrapped.";
open($gift);
is $gift.look, 'A sock!', 'A sock!';

# vim: expandtab shiftwidth=4

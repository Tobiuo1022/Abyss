unit module EvalAsMod;
use MONKEY-SEE-NO-EVAL;

sub EVALASMOD($filename, :$lang = 'Raku', :$check) is export {
    my $code = 'my module Mod {'~"\n"~slurp($filename)~'}';
    EVAL $code, :$lang, :$check, :context(CALLER::), :$filename;
}

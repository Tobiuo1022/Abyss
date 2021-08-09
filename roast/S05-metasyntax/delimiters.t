use v6;
use Test;

plan 21;

# L<S05/Regexes constitute a first-class language, rather than just being strings/can take (almost) any chars as delimiters>

my @delims = < ^ ° ! " § $ % @ € & / = ? ` * + ~ ; , . | >;
my %todo;


for @delims -> $d {
    my $ok  = try { EVAL("my \$x = 'abc'; \$x ~~ m{$d}b{$d}") };
    my $nok = try { EVAL("my \$x = 'abc'; \$x ~~ m{$d}d{$d}") };
    my $is  = try { EVAL("my \$x = 'abc'; \$x ~~ s{$d}a{$d}b{$d}; \$x") } eq 'bbc';
    
    todo "$d not yet supported" if %todo{$d};
    ok $ok && !$nok && $is, "$d as delimiter in match and substitution";
}

# vim: expandtab shiftwidth=4

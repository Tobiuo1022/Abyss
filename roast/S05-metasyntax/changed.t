use v6;
use Test;

plan 12;

# L<S05/Changed metacharacters>

{
    # A dot . now matches any character including newline.
    my $str = "abc\ndef";
    ok($str ~~ /./,   '. matches something');
    ok($str ~~ /c.d/, '. matches \n');
    
    # ^ and $ now always match the start/end of a string, like the old \A and \z.
    ok($str ~~ /^abc/, '^ matches beginning of string');
    ok(!($str ~~ /^de/), '^ does not match \n');
    ok($str ~~ /def$/, '$ matches end of string');
    ok(!($str ~~ /bc$/), '$ does not match \n');
    
    # (The /m modifier is gone.)
    throws-like '$str ~~ m/bc$/m', X::Obsolete, '/m modifier is gone';
}

# A $ no longer matches an optional preceding \n
{
    my $str = "abc\ndef\n";
    ok($str ~~ /def\n$/, '\n$ matches as expected');
    ok(!($str ~~ /def$/),  '$ does not match \n at end of string');
}

# The \A, \Z, and \z metacharacters are gone.
{
    throws-like '/\A/', X::Obsolete, '\\A is gone';
    throws-like '/\Z/', X::Obsolete, '\\Z is gone';
    throws-like '/\z/', X::Obsolete, '\\z is gone';
}

# vim: expandtab shiftwidth=4

use v6;
use Test;
use lib $?FILE.IO.parent(2).add("packages/Test-Helpers");
use Test::Util;

# Tests for ensuring NUL byte is rejected from paths
constant @nuls = ("\0foobar", "foo\0bar", "foobar\0", "\0foo\0bar\0");

plan 7*@nuls;

{
    temp $*CWD = make-temp-dir;
    for @nuls -> $nul {
        my $d = "with {$nul.raku}";
        throws-like { spurt $nul, "foo"   }, X::IO::Null, "&spurt $d";
        throws-like { slurp $nul          }, X::IO::Null, "&slurp $d";
        throws-like { chdir $nul          }, X::IO::Null, "&chdir $d";
        throws-like { open  $nul          }, X::IO::Null, "&open $d";
        throws-like { $nul.IO             }, X::IO::Null, ".IO $d";
        throws-like { IO::Path.new: $nul  }, X::IO::Null, "IO::Path.new $d";
        throws-like { $*CWD.child: $nul   }, X::IO::Null, ".child $d";
    }
}

# vim: expandtab shiftwidth=4

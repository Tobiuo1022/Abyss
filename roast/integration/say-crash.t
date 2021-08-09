use v6;

use Test;

plan 4;

# Insure we can process a big string 

my $filename = "tmpfile.txt";
my $fh = open $filename, :w;

ok $fh, "temp file created successfully";

lives-ok {
        $fh.say: "a" x (2**19);
    }, "2**19 char string prints";

lives-ok {
        $fh.say: "a" x (2**20);
    }, "2**20 char string prints";

$fh.close;

ok unlink($filename), "temp file unlinked successfully";

# vim: expandtab shiftwidth=4

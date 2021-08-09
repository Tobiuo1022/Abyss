use v6;
use Test;

plan 9;

for <id need loaded>.combinations[0 .. *-2] {
    throws-like "class :: does CompUnit::Repository \{ { $_.map({"method {$_}() \{\}"}).join(';') } \}", Exception;
}

eval-lives-ok '
    class MyRepo does CompUnit::Repository {
        method id() { }
        method need() { }
        method load() { }
        method loaded() { }
    }
';

ok $*REPO ~~ CompUnit::Repository;

# vim: expandtab shiftwidth=4

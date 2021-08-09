use v6;
use Test;

# Tests of IO::Special class

plan 16*3;

for [$*OUT.path, 'STDOUT'], [$*ERR.path, 'STDERR'], [$*IN.path, 'STDIN']
    -> ($_, $name)
{
    sub desc { $^v ~ " for $name" }

    cmp-ok .IO, '===', $_, desc '.IO';
    is-deeply .Str,  "<$name>",    desc '.Str';
    is-deeply .what, "<$name>",    desc '.what';
    is-deeply .e,         True,    desc '.e';
    is-deeply .d,         False,   desc '.d';
    is-deeply .f,         False,   desc '.f';
    is-deeply .s,         0,       desc '.s';
    is-deeply .l,         False,   desc '.l';
    is-deeply .x,         False,   desc '.x';
    is-deeply .modified,  Instant, desc '.modified';
    is-deeply .accessed,  Instant, desc '.accessed';
    is-deeply .changed,   Instant, desc '.changed';
    is-deeply .mode,      Nil,     desc '.mode';

    is-deeply .r, $name eq 'STDIN', desc '.r';
    is-deeply .w, $name ne 'STDIN', desc '.w';
}

for <IN OUT ERR> -> $stream {
    is-deeply .raku.EVAL, $_, ".raku for $stream"
        with IO::Special.new: "<STD$stream>";
}

# vim: expandtab shiftwidth=4

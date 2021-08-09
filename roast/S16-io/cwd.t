use v6;
use Test;

# L<S16/IO/$*CWD>
# see also S28-named-variables/cwd.t

plan 3;

isa-ok $*CWD, IO::Path;
lives-ok { $*CWD.raku }, '$*CWD.raku works';
lives-ok { $*CWD.gist }, '$*CWD.gist works';

# vim: expandtab shiftwidth=4

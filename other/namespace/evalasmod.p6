use lib $?FILE.IO.parent(3).add: 'lib';
use Abyss::EvalAsMod;

EVALASMOD $?FILE.IO.parent.add('stradd.p6');
EVALASMOD $?FILE.IO.parent.add('intadd.p6');

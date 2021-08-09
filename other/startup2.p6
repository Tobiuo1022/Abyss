use v6;
use lib $?FILE.IO.parent(2).add: 'lib';
use lib $?FILE.IO.parent(2).add('roast/packages/Test-Helpers');
use Abyss::Server2;

my $otoya = Abyss::Server.new;
$otoya.readeval();

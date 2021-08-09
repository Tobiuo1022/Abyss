use v6;
unit class Abyss::Server:ver<0.0.1>:auth<cpan:ANATOFUZ>;
use Abyss::EvalAsMod;
use NativeCall;

sub dup(int32 $old) returns int32 is native { ... }
sub dup2(int32 $new, int32 $old) returns int32 is native { ... }

method readeval
{
    my $listen = IO::Socket::INET.new(  :listen,
                                  :localhost<localhost>,
                                  :localport(3333) );

    say DateTime.now;
    my $stdout = dup(1);
    my $stderr = dup(2);

    my $conn = $listen.accept;

    my @paths = $conn.recv().lines;
    say "evaling "~$_ for @paths;

    dup2($conn.native-descriptor(), 1);
    dup2($conn.native-descriptor(), 2);

    for @paths -> $path {
        try EVALASMOD $path;
        say $! if $!;
    }

    $conn.close;

    $listen.close;

    dup2($stdout, 1);
    dup2($stderr, 2);
}

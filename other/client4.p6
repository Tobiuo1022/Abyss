sub send-path (Str $path) {
    my $conn = IO::Socket::INET.new( :host<localhost>,
                                     :port(3333) );

    $conn.print: $path;
    while my $buf = $conn.recv(:bin) {
        print $buf.decode;
    }

    $conn.close;
}

my $rakudos = shell 'cat ' ~ $?FILE.IO.parent(2).add('roast/rakudolist'), :out;
my @paths = $rakudos.out.slurp.lines;
send-path $_ for @paths;

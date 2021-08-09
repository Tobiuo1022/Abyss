sub send-paths (Str $path) {
    my $conn = IO::Socket::INET.new( :host<localhost>,
                                     :port(3333) );

    $conn.print: $path;
    while my $buf = $conn.recv(:bin) {
        print $buf.decode;
    }

    $conn.close;
}

sub MAIN(**@ARGS) {
    send-paths $_.IO.resolve.absolute for @ARGS;
}

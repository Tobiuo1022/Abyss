sub send-path (Str $path) {
    my $conn = IO::Socket::INET.new( :host<localhost>,
                                     :port(3333) );

    $conn.print: $path;
    while my $buf = $conn.recv(:bin) {
        print $buf.decode;
    }

    $conn.close;
}

sub MAIN(Str $path) {
    send-path $path.IO.resolve.absolute;
}

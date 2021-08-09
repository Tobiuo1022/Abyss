my $rakudos = shell 'cat ' ~ $?FILE.IO.parent(2).add('roast/rakudolist'), :out;

my $conn = IO::Socket::INET.new( :host<localhost>,
                              :port(3333) );

$conn.print: $rakudos.out.slurp;

while my $buf = $conn.recv(:bin) {
    print $buf.decode;
}

$conn.close;

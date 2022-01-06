sub MAIN(**@ARGS) {
    my $conn = IO::Socket::INET.new( :host<localhost>,
                                     :port(3333) );
    my $sender = Promise.new;
    my $receiver = Promise.new;

    # send multipul file names
    #     filename1\n
    #     filename2\n
    #     \n
    # $conn.flush;

    $sender.then(
        -> $v { 
            $conn.print: $_.IO.resolve.absolute for @ARGS;
            
        } 
    );

    $receiver.then(
        -> $v {  
            while my $buf = $conn.recv(:bin) {
                print $buf.decode;
	    }
        }
    );

#    $sender.await;
#    $receiver.await;
     await $sender, $receiver;
}

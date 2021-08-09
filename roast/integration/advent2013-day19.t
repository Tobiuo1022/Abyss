use v6;
use Test;
plan 4;

{
    my $measurements = Supplier.new;

    my %measured;
    sub measure($test, $value) {
        push %measured{$test}, $value;
    }

    $measurements.Supply.tap(-> $value {
        measure "Measured", $value;
    });

    $measurements.emit(1.5);
    $measurements.emit(2.3);
    $measurements.emit(4.6);
    is-deeply %measured, {"Measured" => [1.5, 2.3, 4.6]}, 'supply - singular tap';

    %measured = ();
    $measurements.Supply.tap(-> $value {
        measure "Also measured", $value;
    });

    $measurements.emit(2.8);

    is-deeply %measured, {"Measured" => [2.8], "Also measured" => [2.8]}, 'supply dual tap';

    $measurements.Supply.grep(* > 4).tap(-> $value {
        measure "HIGH", $value;
    });

    %measured = ();
    $measurements.emit(1.6);
    is-deeply %measured, {"Measured" => [1.6], "Also measured" => [1.6]}, 'supply grep and tap';

    %measured = ();
    $measurements.emit(4.5);
    is-deeply %measured, {"Measured" => [4.5], "Also measured" => [4.5], "HIGH" => [4.5]}, 'supply grep and tap';
}

{
    my $belt_raw = Supply.interval(.1).map({ rand xx 20 });
    my $belt_avg = $belt_raw.map(sub (@values) {
        ([+] @values) / @values
    });

    my $belt_labeled = $belt_avg.map({ Belt => $_ });
    my $samples = Supply.interval(.5).map({ rand });
    my $samples_labeled = $samples.map({ Sample =>  $_});
    my $merged = $belt_labeled.merge($samples_labeled);
## todo: use Test::Tap tap-ok
##    $merged.tap(&say);
}



# vim: expandtab shiftwidth=4

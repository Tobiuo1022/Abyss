use v6;
use Test;

plan 4;

# real scheduling here
my $name = $*SCHEDULER.^name;

{
    my $tracker = 0;
    my $c = $*SCHEDULER.cue({ cas $tracker, {.succ} }, :times(10));
    isa-ok( $c, Cancellation );
    sleep 3;
    is $tracker, 10, "Cue on $name with :times(10)";
    LEAVE .cancel with $c;
}

# fake scheduling from here on out
$*SCHEDULER = CurrentThreadScheduler.new;
$name = $*SCHEDULER.^name;

{
    my $tracker;
    my $c = $*SCHEDULER.cue({ $tracker++ }, :times(10));
    ok $c.can("cancel"), 'can we cancel';
    is $tracker, 10, "Cue on $name with :times(10)";
    LEAVE .cancel with $c;
}

# vim: expandtab shiftwidth=4

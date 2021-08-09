use v6;

use Test;

plan 17;

unless (try { EVAL("1", :lang<Perl5>) }) {
    skip-rest;
    exit;
}

die unless
EVAL(q/
package My::Array;
use strict;

sub new {
    my ($class, $ref) = @_;
    bless \$ref, $class;
}

sub array {
    my $self = shift;
    return $$self;
}

sub my_elems {
    my $self = shift;
    return scalar(@{$$self});
}

sub my_exists {
    my ($self, $idx) = @_;
    return exists $$self->[$idx];
}

sub fetch {
    my ($self, $idx) = @_;
    return $$self->[$idx];
}

sub store {
    my ($self, $idx, $val) = @_;
    $$self->[$idx] = $val;
}

sub push {
    my ($self, $val) = @_;
    push @{$$self}, $val;
}

1;
/, :lang<Perl5>);

my $p5ar = EVAL('sub { My::Array->new($_[0]) }', :lang<Perl5>);
my @array = (5,6,7,8);
my $p5array = $p5ar($@array);

my $retarray = $p5array.array;

is($p5array.my_elems, @array.elems, 'elems');
is($p5array.my_exists(1), +(@array[1]:exists), 'exists');
is($p5array.my_exists(10), +(@array[10]:exists), 'nonexists fail');
is($p5array.fetch(3)+0, @array[3], 'fetch');

my $match = 0;
lives-ok {
    $match = ?($retarray.[3] ~~ @array[3]);
}, 'can retro fetch';
ok $match, 'retro fetch';

is(EVAL(q{$retarray.elems}), @array.elems, 'retro elems');
is($retarray[1]:exists, @array[1]:exists, 'retro exists');
is($retarray[10]:exists, @array[10]:exists, 'retro nonexists' );

ok(($p5array.push(9)), 'can push');

is(0+$p5array.fetch(4), 9, 'push result via obj');
#?rakudo todo "doesn't work yet due to copying of arrays"
{
    is(@array[4], 9, 'push result via array');
}

#$retarray.push(9);  # this will loop

#?rakudo todo "doesn't work yet due to copying of arrays"
{
    is(0+$p5array.fetch(5), 9, 'retro push result');
    is(@array[5], 9, 'retro push result');
}

ok($p5array.store(0,3), 'can store');

#?rakudo todo "doesn't work yet due to copying of arrays"
{
    is(@array[0], 3, 'store result');
}
is(0+$p5array.fetch(0), 3, 'store result');

# TODO: pop, shift, unshift, splice, delete

# vim: expandtab shiftwidth=4

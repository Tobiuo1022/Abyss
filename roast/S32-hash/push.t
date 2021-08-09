use v6;
use Test;
plan 10;

# L<S32::Containers/Hash/"Like hash assignment insofar">

my %ref1 = (a => 1, b => 2, c => 3);
my %ref2 = (a => [1, 4, 5], b => 2, c => 3);

{

    my ($r, %x);
    $r = %x.push: 'a' => 1;
    is $r.WHAT.gist, Hash.gist, 'Hash.push returns hash';

    my %h;
    %h.push: 'b', 2, 'a', 1, 'c', 3;
    is-deeply %h, %ref1, 'basic Hash.push with alternating items';
    %h.push: (:a(4), :a(5));
    is-deeply %h, %ref2, 'stacking push works with pairs';

    my %g;
    %g.push: (a => 1), (c => 3), (b => 2);
    is-deeply %g, %ref1, 'basic Hash.push with pairs ';
    %g.push: 'a', 4, 'a', 5;
    is-deeply %g, %ref2, 'stacking push worsk with alternating items';

    my %hh;
    %hh.push: 5, 'bar';
    is-deeply %hh, { 5 => 'bar' }, 'Hash.push works pushing a non-Str-keyed alternating items';

    my %gg;
    %gg.push: 5 => 'bar';
    is-deeply %gg, { 5 => 'bar' }, 'Hash.push works pushing a non-Str-keyed Pair';
}

{
    my %a = :a(1), :b(2, 3), :c[4, 5], :d(6);
    my %to-append = :a('X'), :b('Y'), :c('Z');
    %a.append(%to-append);
    is-deeply %a, %( :a[1, 'X'], :b[2, 3, 'Y'], :c[4, 5, 'Z'], :d(6) ),
        'Hash.apend general functionailty';
}

{
    my %a = :a[1, 2];
    my %p = :a[1, 2];

    %p.push( %( :a[3, 4] ) );
    %a.append( %( :a[3, 4] ) );
    is-deeply %p, %( :a[1, 2, [3, 4]] ), 'Hash.push pushes to array elements';
    is-deeply %a, %( :a[1, 2, 3, 4] ), 'Hash.append appends to array elements';
}

# vim: expandtab shiftwidth=4

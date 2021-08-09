# http://perl6advent.wordpress.com/2009/12/23/day-23-lazy-fruits-from-the-gather-of-eden/

use v6;
use Test;

plan 10;

my @gather-result = gather { take $_ for 5..7 };

my @push-result;
push @push-result, $_ for 5..7;

is @gather-result, @push-result, 'Gather/task and push building the same list';

sub incremental-concat(@list) {
    my $string-accumulator = "";
    gather for @list {
        take ~($string-accumulator ~= $_);
    }
};

is incremental-concat(<a b c>), ["a", "ab", "abc"], 'String accumulator';

class Tree {
    has Tree $.left;
    has Tree $.right;
    has Str $.node;
}

sub transform(Tree $t) {
    $t.node();
}

sub traverse-tree-inorder(Tree $t) {
  traverse-tree-inorder($t.left) if $t.left;
  take transform($t);
  traverse-tree-inorder($t.right) if $t.right;
}

my $tree = Tree.new(
                node => 'a',
                left => Tree.new(
                    node => 'b',
                    left => Tree.new(
                        node => 'c'
                    ),
                    right => Tree.new(
                        node => 'd'
                    )
                ),
                right => Tree.new(
                    node => 'e'
                )
           );
my @all-nodes = gather traverse-tree-inorder($tree);

is @all-nodes, ["c", "b", "d", "a", "e"], 'In order tree traversal with gather/take';

{
    my @natural-numbers = 0 .. Inf;
    is @natural-numbers[7], 7, 'natural numbers';

    my @even-numbers  = 0, 2 ... *;    # arithmetic seq
    is @even-numbers[7], 14, 'even numbers';

    my @odd-numbers   = 1, 3 ... *;
    is @odd-numbers[7], 15, 'odd numbers';

    my @powers-of-two = 1, 2, 4 ... *; # geometric seq
    is @powers-of-two[7], 128, 'powers of two';

    my @squares-of-odd-numbers = map { $_ * $_ }, @odd-numbers;
    is @squares-of-odd-numbers[4], 81, 'square of odd numbers';

    sub enumerate-positive-rationals() { # with duplicates, but still
      take 1;
      for 1..Inf -> $total {
        for 1..^$total Z reverse(1..^$total) -> $numerator, $denominator {
          take $numerator / $denominator;
        }
      }
    }

    sub enumerate-all-rationals() {
      map { $_, -$_ }, enumerate-positive-rationals();
    }

    # TODO - we need a test for enumerate-all-rationals

    sub fibonacci() {
      gather {
        take 0;
        my ($last, $this) = 0, 1;
        loop { # infinitely!
          take $this;
          ($last, $this) = $this, $last + $this;
        }
      }
    }

    is fibonacci[10], 55, 'Lazy implementation of fibonacci with gather/take';
}

sub merge(@a, @b) {
  !@a && !@b ?? () !!
  !@a        ?? @b !!
         !@b ?? @a !!
  (@a[0] < @b[0] ?? @a.shift !! @b.shift, merge(@a, @b))
}

sub hamming-sequence() { # 2**a * 3**b * 5**c, where { all(a,b,c) >= 0 }
  gather {
    take 1;
    take $_ for
        merge( (map { 2 * $_ }, hamming-sequence()),
               merge( (map { 3 * $_ }, hamming-sequence()),
                      (map { 5 * $_ }, hamming-sequence()) ));
  }
}

# TODO - we need some tests for merge and hamming problem above

my @tree = gather {
    my %r=(^8)>>.fmt("%03b") Z=> (0,1,1,1,1,0,0,0);
    take <. X>[my@i=flat 0 xx 9,1,0 xx 9].join;
    for ^9 {take <. X>[@i=map {%r{@i[($_-1)%19,$_,($_+1)%19].join}},^19].join};
}

is-deeply @tree, [q:to"........| |........".lines], 'xmas tree';
.........X.........
........XXX........
.......XX..X.......
......XX.XXXX......
.....XX..X...X.....
....XX.XXXX.XXX....
...XX..X....X..X...
..XX.XXXX..XXXXXX..
.XX..X...XXX.....X.
XX.XXXX.XX..X...XXX
........| |........
     #########
      #######
       #####

# vim: expandtab shiftwidth=4

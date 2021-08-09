use v6;

use Test;

plan 4;

=begin desc

Test a bug where sub args of type Sub do not get handled correctly.

=end desc

sub foo (Sub $code, Str $a, Str $b) { return $a.WHAT }   #OK not used

throws-like {foo(-> { die "test" }, "a", "b")},
  X::TypeCheck::Binding,
  'pointy block is not a sub';
lives-ok {foo( sub { die "test" }, 'a', 'b')}, 'anonymous sub as argument not executed';

sub foo2 (Sub $code, Str $a, Str $b?) { return $a.WHAT }   #OK not used

throws-like {foo2(-> { die "test" }, "a", "b")},
  X::TypeCheck::Binding,
  'pointy block is not a sub (with optional last arg)';
lives-ok {foo2( sub { die "test" }, 'a', 'b')}, 'anonymous sub as argument not executed (with optional last arg)';

# vim: expandtab shiftwidth=4

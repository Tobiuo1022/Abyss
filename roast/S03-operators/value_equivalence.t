use v6;

use Test;

=begin pod

C<===> and C<eqv> are 2 distinct operators, where C<===> tests value
equivalence for immutable types and reference equivalence for
mutable types, and C<eqv> tests value equivalence for snapshots of mutable
types.  So C<(1,2) === (1,2)> returns true but C<[1,2] === [1,2]> returns
false, and C<[1,2] eqv [1,2]> returns true.

=end pod

# L<S03/"Chaining binary precedence" /Value identity>

plan 87;

# === on values
{
  ok  (1 === 1), "=== on values (1)";
  ok  (0 === 0), "=== on values (2)";
  ok  (1 + 1 === 2), '=== on non-literal values';
  ok !(0 === 1), "=== on values (3)";
  isa-ok (1 === 1), Bool, "=== on values (4)";
  ok  ("abc" === "abc"), "=== on values(abc)";
  ok !("abc" === "ABC"), "=== on values(abc === ABC)";
  isa-ok ("abc" === "abc"), Bool, "=== on values (abc)";
  ok !(1 === 1.0), "=== on values (1 === 1.0)";
  ok !(1 === "1"), '=== on values (1 === "1")';
}

# more value tests
{
  ok 1/2 === 1/2,                "=== on Rats";
  ok 1/2 !=== 3/2,               "!=== on Rats";
  isa-ok 1/2 === 1/2, Bool,      "=== on Rats yields Bool";
  isa-ok 1/2 !=== 3/2, Bool,     "!=== on Rats yields Bool";
  ok 0.5e0 === 0.5e0,            "=== on Nums";
  ok 0.5e0 !=== 1.5e0,           "!=== on Nums";
  isa-ok 0.5e0 === 0.5e0, Bool,  "=== on Nums yields Bool";
  isa-ok 0.5e0 !=== 1.5e0, Bool, "!=== on Nums yields Bool";
  ok 1i === 1i,                  "=== on Complex (1)";
  ok 2 + 4i === 2 + 4i,          "=== on Complex (2)";
  ok 1i !=== 2i,                 "!=== on Complex (1)";
  ok 2 + 4i !=== 3 + 4i,         "!=== on Complex (2)";
  isa-ok 1i === 1i, Bool,        "=== on Complexes yields Bool";
  isa-ok 1i !=== 2i, Bool,       "!=== on Complexes yields Bool";
}

# Value types
{
  my $a = 1;
  my $b = 1;

  ok $a === $a, "=== on value types (1-1)";
  ok $b === $b, "=== on value types (1-2)";
  ok $a === $b, "=== on value types (1-3)";
  isa-ok $a === $b, Bool, "=== on value types (1-4)";
}

{
  my $a = 1;
  my $b = 2;

  ok  ($a === $a), "=== on value types (2-1)";
  ok  ($b === $b), "=== on value types (2-2)";
  ok !($a === $b), "=== on value types (2-3)";
  isa-ok ($a === $a), Bool, "=== on value types (2-4)";
}

# Reference types
{
  my @a = (1,2,3);
  my @b = (1,2,3);

  ok  (\@a === \@a), "=== on array references (1)";
  ok  (\@b === \@b), "=== on array references (2)";
  ok !(\@a === \@b), "=== on array references (3)";
  isa-ok (\@a === \@a), Bool, "=== on array references (4)";
}

{
  my $a = \3;
  my $b = \3;

  ok  ($a === $a), "=== on scalar references (1-1)";
  ok  ($b === $b), "=== on scalar references (1-2)";
  ok $a === $b, "=== on scalar references (1-3)";
  isa-ok ($a === $a), Bool, "=== on scalar references (1-4)";
}

{
  my $a = { 3 };
  my $b = { 3 };

  ok  ($a === $a), "=== on sub references (1-1)";
  ok  ($b === $b), "=== on sub references (1-2)";
  ok !($a === $b), "=== on sub references (1-3)";
  isa-ok ($a === $a), Bool, "=== on sub references (1-4)";
}

{
  ok  (&say === &say), "=== on sub references (2-1)";
  ok  (&map === &map), "=== on sub references (2-2)";
  ok !(&say === &map), "=== on sub references (2-3)";
  isa-ok (&say === &say), Bool, "=== on sub references (2-4)";
}

{
  my $num = 3;
  my $a   = \$num;
  my $b   = \$num;

  ok  ($a === $a), "=== on scalar references (2-1)";
  ok  ($b === $b), "=== on scalar references (2-2)";
  ok  ($a === $b), "=== on scalar references (2-3)";
  isa-ok ($a === $a), Bool, "=== on scalar references (2-4)";
}

{
  ok !([1,2,3] === [4,5,6]), "=== on anonymous array references (1)";
  ok !([1,2,3] === [1,2,3]), "=== on anonymous array references (2)";
  ok !([]      === []),      "=== on anonymous array references (3)";
  isa-ok ([1,2,3] === [4,5,6]), Bool, "=== on anonymous array references (4)";
}

{
  ok !({a => 1} === {a => 2}), "=== on anonymous hash references (1)";
  ok !({a => 1} === {a => 1}), "=== on anonymous hash references (2)";
  isa-ok ({a => 1} === {a => 2}), Bool, "=== on anonymous hash references (3)";
}

{
  ok !(\3 === \4),          "=== on anonymous scalar references (1)";
  ok \3 === \3,          "=== on anonymous scalar references (2)";
  isa-ok (\3 === \4), Bool, "=== on anonymous scalar references (4)";
}

# Chained === (not specced, but obvious)
{
  ok  (3 === 3 === 3), "chained === (1)";
  ok !(3 === 3 === 4), "chained === (2)";
}

# Subparam binding doesn't affect === test
{
  my $foo;
  my $test = -> $arg { $foo === $arg };

  $foo = 3;
  ok  $test($foo), "subparam binding doesn't affect === (1)";
  ok  $test(3),    "subparam binding doesn't affect === (2)";

  ok !$test(4),    "subparam binding doesn't affect === (3)";
  my $bar = 4;
  ok !$test($bar), "subparam binding doesn't affect === (4)";
}

{
    my $a = 1;
    my $b = 2;
    is($a === $a, Bool::True,  '=== returns Bool::True when true');
    is($a === $b, Bool::False, '=== returns Bool::False when false');
}

# L<S03/"Chaining binary precedence" /Negated relational operators>
{
  ok !(1 !=== 1), "!=== on values (1)";
  ok !(0 !=== 0), "!=== on values (2)";
  ok  (1 !=== 0), "!=== on values (3)";
  isa-ok (1 !=== 1), Bool, "!=== on values (4)";
  ok !("abc" !=== "abc"), "!=== on values(abc)";
  ok  ("abc" !=== "ABC"), "!=== on values(abc !=== ABC)";
  ok  (1 !=== 1.0), "!=== on values (1 !=== 1.0)";
  ok  (1 !=== "1"), '!=== on values (1 !=== "1")';
}

ok     1|2 === 1,  '=== does autothread (1)';
isa-ok  1|2 === 1, Junction,  '=== does autothread (2)';

{
    my $a = do {
        my role A { };
        "x" but A;
    };
    my $b = do {
        my role A { };
        "x" but A;
    };
    nok $a === $b, 'two lexical roles come out as different when compared with ===';
}

{
    nok 1 === 1 but role { },     '=== on Int correctly demands exact type match';
    nok 1e1 === 1e1 but role { }, '=== on Num correctly demands exact type match';
    nok 1/2 === 1/2 but role { }, '=== on Rat correctly demands exact type match';
    nok 1i === 1i but role { },   '=== on Complex correctly demands exact type match';
}

{ # coverage; 2016-09-19
    is-deeply infix:<===>(42),    Bool::True, 'single arg === gives True';
    is-deeply infix:<===>(),      Bool::True, '    no arg === gives True';
}

# vim: expandtab shiftwidth=4

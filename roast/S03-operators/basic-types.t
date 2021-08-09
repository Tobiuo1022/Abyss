use v6;

use Test;

plan 19;

# WHAT() on basic types

my $a;
is($a.WHAT.gist, Any.gist, 'empty scalar is Any');

my @a;
ok(@a ~~ Array, 'it is an Array type');
ok @a ~~ Positional, 'An Array does Positional';

my %a;
ok(%a ~~ Hash, 'it is an Hash type');
ok %a ~~ Associative, 'A Hash does Associative';

# WHAT() on reference types

my $b1 = [];
ok($b1 ~~ Array, 'it is a Array type');

# this seems to be the only way to make a hash - ref at the moment
my %b2 = ("one", 1); my $b2 = %b2;
ok($b2 ~~ Hash, 'it is a Hash type'); 

# WHAT() on subroutines

my $s1 = sub {};
isa-ok($s1, Sub, 'it is a Sub type');

# See L<S02/"Built-in Data Types">
# Quoting A06:
#                                   Code
#                        ____________|________________
#                       |                             |
#                    Routine                        Block
#       ________________|_______________ 
#      |     |       |       |    |     |
#     Sub Method Submethod Multi Rule Macro

# L<S06/Anonymous hashes vs blocks>
my $s2 = {};
ok($s2 ~~ Hash, 'it is a Hash type (bare block)');

# L<S06/"Placeholder variables">
my $s2a = { $^aaa };
isa-ok($s2a, Block, 'it is a Parametric type (bare block with placeholder parameters)');

{
    my $s3 = -> {};
    isa-ok($s3, Block, 'it is a Block type (pointy block)');
}

# WHAT() on different types of scalars

my $int = 0;
isa-ok($int, Int, 'it is an Int type');

my $num = '';
ok(+$num ~~ Real, 'it is an Real type');

my $float = 0.5e0;
isa-ok($float, Num, 'it is an Num type');
isa-ok(1 / 4, Rat, 'infix:</> of integers produces a Rat');

my $string = "Hello World";
isa-ok($string, Str, 'it is a Str type');

my $bool = (0 == 0);
isa-ok($bool, Bool, 'it is a Bool type');

my $pair = ("foo" => "bar");
isa-ok($pair, Pair, 'it is a Pair type');

{
    my $rule = rx/^hello\sworld$/;
    isa-ok($rule, Regex, 'it is a Regex type');
}

# vim: expandtab shiftwidth=4

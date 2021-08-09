use v6;

#BEGIN %*ENV<PERL6_TEST_DIE_ON_FAIL> = True;
use Test;

# Test combinations of flags for "%b".  The @info array is intialized with the
# flags (as a string), the size/precision specification (either a string or a
# number), and the expected strings for the values 0, 1, 4 and -4.  The flags
# values will be expanded to all possible permutations to ensure that the
# order of the flags is irrelevant.  Each flag permutation is combined with
# the size/permutation value to create a proper format string.  Each test will
# be done twice: once with a lowercase "b" and once with an uppercase "B".

#                        0 ,         1 ,         4 ,        -4 ;
my @info = ( # |-----------|-----------|-----------|-----------|
             # no size or size explicitely 0
       '',   '',        "0",        "1",      "100",     "-100",
      ' ',   '',       " 0",       " 1",     " 100",     "-100",
      '0',   '',        "0",        "1",      "100",     "-100",
     '0 ',   '',       " 0",       " 1",     " 100",     "-100",
      '+',   '',       "+0",       "+1",     "+100",     "-100",
     '+ ',   '',       "+0",       "+1",     "+100",     "-100",
     '+0',   '',       "+0",       "+1",     "+100",     "-100",
    '+0 ',   '',       "+0",       "+1",     "+100",     "-100",
      '-',   '',        "0",        "1",      "100",     "-100",
     '-+',   '',       "+0",       "+1",     "+100",     "-100",
     '- ',   '',       " 0",       " 1",     " 100",     "-100",
    '-+ ',   '',       "+0",       "+1",     "+100",     "-100",
     '-0',   '',        "0",        "1",      "100",     "-100",
    '-+0',   '',       "+0",       "+1",     "+100",     "-100",
    '-0 ',   '',       " 0",       " 1",     " 100",     "-100",
   '-+0 ',   '',       "+0",       "+1",     "+100",     "-100",
      '#',   '',        "0",      "0b1",    "0b100",   "-0b100",
     '# ',   '',       " 0",     " 0b1",   " 0b100",   "-0b100",
     '#0',   '',        "0",      "0b1",    "0b100",   "-0b100",
    '#0 ',   '',       " 0",     " 0b1",   " 0b100",   "-0b100",
     '#+',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#+ ',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#+0',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",
   '#+0 ',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",
     '#-',   '',        "0",      "0b1",    "0b100",   "-0b100",
    '#-+',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#- ',   '',       " 0",     " 0b1",   " 0b100",   "-0b100",
   '#-+ ',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#-0',   '',        "0",      "0b1",    "0b100",   "-0b100",
   '#-+0',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",
   '#-0 ',   '',       " 0",     " 0b1",   " 0b100",   "-0b100",
  '#-+0 ',   '',       "+0",     "+0b1",   "+0b100",   "-0b100",

             # no size, precision 0
       '', '.0',         "",        "1",      "100",     "-100",
      ' ', '.0',         "",       " 1",     " 100",     "-100",
      '0', '.0',         "",        "1",      "100",     "-100",
     '0 ', '.0',         "",       " 1",     " 100",     "-100",
      '+', '.0',         "",       "+1",     "+100",     "-100",
     '+ ', '.0',         "",       "+1",     "+100",     "-100",
     '+0', '.0',         "",       "+1",     "+100",     "-100",
    '+0 ', '.0',         "",       "+1",     "+100",     "-100",
      '-', '.0',         "",        "1",      "100",     "-100",
     '-+', '.0',         "",       "+1",     "+100",     "-100",
     '- ', '.0',         "",       " 1",     " 100",     "-100",
    '-+ ', '.0',         "",       "+1",     "+100",     "-100",
     '-0', '.0',         "",        "1",      "100",     "-100",
    '-+0', '.0',         "",       "+1",     "+100",     "-100",
    '-0 ', '.0',         "",       " 1",     " 100",     "-100",
   '-+0 ', '.0',         "",       "+1",     "+100",     "-100",
      '#', '.0',         "",      "0b1",    "0b100",   "-0b100",
     '# ', '.0',         "",     " 0b1",   " 0b100",   "-0b100",
     '#0', '.0',         "",      "0b1",    "0b100",   "-0b100",
    '#0 ', '.0',         "",     " 0b1",   " 0b100",   "-0b100",
     '#+', '.0',         "",     "+0b1",   "+0b100",   "-0b100",
    '#+ ', '.0',         "",     "+0b1",   "+0b100",   "-0b100",
    '#+0', '.0',         "",     "+0b1",   "+0b100",   "-0b100",
   '#+0 ', '.0',         "",     "+0b1",   "+0b100",   "-0b100",
     '#-', '.0',         "",      "0b1",    "0b100",   "-0b100",
    '#-+', '.0',         "",     "+0b1",   "+0b100",   "-0b100",
    '#- ', '.0',         "",     " 0b1",   " 0b100",   "-0b100",
   '#-+ ', '.0',         "",     "+0b1",   "+0b100",   "-0b100",
    '#-0', '.0',         "",      "0b1",    "0b100",   "-0b100",
   '#-+0', '.0',         "",     "+0b1",   "+0b100",   "-0b100",
   '#-0 ', '.0',         "",     " 0b1",   " 0b100",   "-0b100",
  '#-+0 ', '.0',         "",     "+0b1",   "+0b100",   "-0b100",

             # 2 positions, usually doesn't fit
       '',    2,       " 0",       " 1",      "100",     "-100",
      ' ',    2,       " 0",       " 1",     " 100",     "-100",
      '0',    2,       "00",       "01",      "100",     "-100",
     '0 ',    2,       " 0",       " 1",     " 100",     "-100",
      '+',    2,       "+0",       "+1",     "+100",     "-100",
     '+ ',    2,       "+0",       "+1",     "+100",     "-100",
     '+0',    2,       "+0",       "+1",     "+100",     "-100",
    '+0 ',    2,       "+0",       "+1",     "+100",     "-100",
      '-',    2,       "0 ",       "1 ",      "100",     "-100",
     '-+',    2,       "+0",       "+1",     "+100",     "-100",
     '- ',    2,       " 0",       " 1",     " 100",     "-100",
    '-+ ',    2,       "+0",       "+1",     "+100",     "-100",
     '-0',    2,       "0 ",       "1 ",      "100",     "-100",
    '-+0',    2,       "+0",       "+1",     "+100",     "-100",
    '-0 ',    2,       " 0",       " 1",     " 100",     "-100",
   '-+0 ',    2,       "+0",       "+1",     "+100",     "-100",
      '#',    2,       " 0",      "0b1",    "0b100",   "-0b100",
     '# ',    2,       " 0",     " 0b1",   " 0b100",   "-0b100",
     '#0',    2,       "00",      "0b1",    "0b100",   "-0b100",
    '#0 ',    2,       " 0",     " 0b1",   " 0b100",   "-0b100",
     '#+',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#+ ',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#+0',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",
   '#+0 ',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",
     '#-',    2,       "0 ",      "0b1",    "0b100",   "-0b100",
    '#-+',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#- ',    2,       " 0",     " 0b1",   " 0b100",   "-0b100",
   '#-+ ',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",
    '#-0',    2,       "0 ",      "0b1",    "0b100",   "-0b100",
   '#-+0',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",
   '#-0 ',    2,       " 0",     " 0b1",   " 0b100",   "-0b100",
  '#-+0 ',    2,       "+0",     "+0b1",   "+0b100",   "-0b100",

             # 8 positions, should always fit
       '',    8, "       0", "       1", "     100", "    -100",
      ' ',    8, "       0", "       1", "     100", "    -100",
      '0',    8, "00000000", "00000001", "00000100", "-0000100",
     '0 ',    8, " 0000000", " 0000001", " 0000100", "-0000100",
      '+',    8, "      +0", "      +1", "    +100", "    -100",
     '+ ',    8, "      +0", "      +1", "    +100", "    -100",
     '+0',    8, "+0000000", "+0000001", "+0000100", "-0000100",
    '+0 ',    8, "+0000000", "+0000001", "+0000100", "-0000100",
      '-',    8, "0       ", "1       ", "100     ", "-100    ",
     '-+',    8, "+0      ", "+1      ", "+100    ", "-100    ",
     '- ',    8, " 0      ", " 1      ", " 100    ", "-100    ",
    '-+ ',    8, "+0      ", "+1      ", "+100    ", "-100    ",
     '-0',    8, "0       ", "1       ", "100     ", "-100    ",
    '-+0',    8, "+0      ", "+1      ", "+100    ", "-100    ",
    '-0 ',    8, " 0      ", " 1      ", " 100    ", "-100    ",
   '-+0 ',    8, "+0      ", "+1      ", "+100    ", "-100    ",
      '#',    8, "       0", "     0b1", "   0b100", "  -0b100",
     '# ',    8, "       0", "     0b1", "   0b100", "  -0b100",
     '#0',    8, "00000000", "0b000001", "0b000100", "-0b00100",
    '#0 ',    8, " 0000000", " 0b00001", " 0b00100", "-0b00100",
     '#+',    8, "      +0", "    +0b1", "  +0b100", "  -0b100",
    '#+ ',    8, "      +0", "    +0b1", "  +0b100", "  -0b100",
    '#+0',    8, "+0000000", "+0b00001", "+0b00100", "-0b00100",
   '#+0 ',    8, "+0000000", "+0b00001", "+0b00100", "-0b00100",
     '#-',    8, "0       ", "0b1     ", "0b100   ", "-0b100  ",
    '#-+',    8, "+0      ", "+0b1    ", "+0b100  ", "-0b100  ",
    '#- ',    8, " 0      ", " 0b1    ", " 0b100  ", "-0b100  ",
   '#-+ ',    8, "+0      ", "+0b1    ", "+0b100  ", "-0b100  ",
    '#-0',    8, "0       ", "0b1     ", "0b100   ", "-0b100  ",
   '#-+0',    8, "+0      ", "+0b1    ", "+0b100  ", "-0b100  ",
   '#-0 ',    8, " 0      ", " 0b1    ", " 0b100  ", "-0b100  ",
  '#-+0 ',    8, "+0      ", "+0b1    ", "+0b100  ", "-0b100  ",

             # 8 positions with precision, precision fits sometimes
       '',  8.2, "      00", "      01", "     100", "    -100",
      ' ',  8.2, "      00", "      01", "     100", "    -100",
      '0',  8.2, "      00", "      01", "     100", "    -100",
     '0 ',  8.2, "      00", "      01", "     100", "    -100",
      '+',  8.2, "     +00", "     +01", "    +100", "    -100",
     '+ ',  8.2, "     +00", "     +01", "    +100", "    -100",
     '+0',  8.2, "     +00", "     +01", "    +100", "    -100",
    '+0 ',  8.2, "     +00", "     +01", "    +100", "    -100",
      '-',  8.2, "00      ", "01      ", "100     ", "-100    ",
     '-+',  8.2, "+00     ", "+01     ", "+100    ", "-100    ",
     '- ',  8.2, " 00     ", " 01     ", " 100    ", "-100    ",
    '-+ ',  8.2, "+00     ", "+01     ", "+100    ", "-100    ",
     '-0',  8.2, "00      ", "01      ", "100     ", "-100    ",
    '-+0',  8.2, "+00     ", "+01     ", "+100    ", "-100    ",
    '-0 ',  8.2, " 00     ", " 01     ", " 100    ", "-100    ",
   '-+0 ',  8.2, "+00     ", "+01     ", "+100    ", "-100    ",
      '#',  8.2, "      00", "    0b01", "   0b100", "  -0b100",
     '# ',  8.2, "      00", "    0b01", "   0b100", "  -0b100",
     '#0',  8.2, "      00", "    0b01", "   0b100", "  -0b100",
    '#0 ',  8.2, "      00", "    0b01", "   0b100", "  -0b100",
     '#+',  8.2, "     +00", "   +0b01", "  +0b100", "  -0b100",
    '#+ ',  8.2, "     +00", "   +0b01", "  +0b100", "  -0b100",
    '#+0',  8.2, "     +00", "   +0b01", "  +0b100", "  -0b100",
   '#+0 ',  8.2, "     +00", "   +0b01", "  +0b100", "  -0b100",
     '#-',  8.2, "00      ", "0b01    ", "0b100   ", "-0b100  ",
    '#-+',  8.2, "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",
    '#- ',  8.2, " 00     ", " 0b01   ", " 0b100  ", "-0b100  ",
   '#-+ ',  8.2, "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",
    '#-0',  8.2, "00      ", "0b01    ", "0b100   ", "-0b100  ",
   '#-+0',  8.2, "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",
   '#-0 ',  8.2, " 00     ", " 0b01   ", " 0b100  ", "-0b100  ",
  '#-+0 ',  8.2, "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",

).map: -> $flags, $size, $r0, $r1, $r4, $rm {
    my @flat;
    @flat.append(
      '%' ~ $_ ~ $size ~ 'b',
      ($r0 => 0, $r1 => 1, $r4 => 4, $rm => -4)
    ) for $flags.comb.permutations>>.join;
    |@flat
}

# tests using variable precision 0
@info.append( (
             # no size, precision 0
       '', '.*',         "",        "1",      "100",     "-100",
      ' ', '.*',         "",       " 1",     " 100",     "-100",
      '0', '.*',         "",        "1",      "100",     "-100",
     '0 ', '.*',         "",       " 1",     " 100",     "-100",
      '+', '.*',         "",       "+1",     "+100",     "-100",
     '+ ', '.*',         "",       "+1",     "+100",     "-100",
     '+0', '.*',         "",       "+1",     "+100",     "-100",
    '+0 ', '.*',         "",       "+1",     "+100",     "-100",
      '-', '.*',         "",        "1",      "100",     "-100",
     '-+', '.*',         "",       "+1",     "+100",     "-100",
     '- ', '.*',         "",       " 1",     " 100",     "-100",
    '-+ ', '.*',         "",       "+1",     "+100",     "-100",
     '-0', '.*',         "",        "1",      "100",     "-100",
    '-+0', '.*',         "",       "+1",     "+100",     "-100",
    '-0 ', '.*',         "",       " 1",     " 100",     "-100",
   '-+0 ', '.*',         "",       "+1",     "+100",     "-100",
      '#', '.*',         "",      "0b1",    "0b100",   "-0b100",
     '# ', '.*',         "",     " 0b1",   " 0b100",   "-0b100",
     '#0', '.*',         "",      "0b1",    "0b100",   "-0b100",
    '#0 ', '.*',         "",     " 0b1",   " 0b100",   "-0b100",
     '#+', '.*',         "",     "+0b1",   "+0b100",   "-0b100",
    '#+ ', '.*',         "",     "+0b1",   "+0b100",   "-0b100",
    '#+0', '.*',         "",     "+0b1",   "+0b100",   "-0b100",
   '#+0 ', '.*',         "",     "+0b1",   "+0b100",   "-0b100",
     '#-', '.*',         "",      "0b1",    "0b100",   "-0b100",
    '#-+', '.*',         "",     "+0b1",   "+0b100",   "-0b100",
    '#- ', '.*',         "",     " 0b1",   " 0b100",   "-0b100",
   '#-+ ', '.*',         "",     "+0b1",   "+0b100",   "-0b100",
    '#-0', '.*',         "",      "0b1",    "0b100",   "-0b100",
   '#-+0', '.*',         "",     "+0b1",   "+0b100",   "-0b100",
   '#-0 ', '.*',         "",     " 0b1",   " 0b100",   "-0b100",
  '#-+0 ', '.*',         "",     "+0b1",   "+0b100",   "-0b100",

).map: -> $flags, $size, $r0, $r1, $r4, $rm {
    my @flat;
    @flat.append(
      '%' ~ $_ ~ $size ~ 'b',
      ($r0 => (0,0), $r1 => (0,1), $r4 => (0,4), $rm => (0,-4))
   ) for $flags.comb.permutations>>.join;
   |@flat
} );

@info.append( (
             # 8 positions with precision, precision fits sometimes
       '', "8.*", "      00", "      01", "     100", "    -100",
      ' ', "8.*", "      00", "      01", "     100", "    -100",
      '0', "8.*", "      00", "      01", "     100", "    -100",
     '0 ', "8.*", "      00", "      01", "     100", "    -100",
      '+', "8.*", "     +00", "     +01", "    +100", "    -100",
     '+ ', "8.*", "     +00", "     +01", "    +100", "    -100",
     '+0', "8.*", "     +00", "     +01", "    +100", "    -100",
    '+0 ', "8.*", "     +00", "     +01", "    +100", "    -100",
      '-', "8.*", "00      ", "01      ", "100     ", "-100    ",
     '-+', "8.*", "+00     ", "+01     ", "+100    ", "-100    ",
     '- ', "8.*", " 00     ", " 01     ", " 100    ", "-100    ",
    '-+ ', "8.*", "+00     ", "+01     ", "+100    ", "-100    ",
     '-0', "8.*", "00      ", "01      ", "100     ", "-100    ",
    '-+0', "8.*", "+00     ", "+01     ", "+100    ", "-100    ",
    '-0 ', "8.*", " 00     ", " 01     ", " 100    ", "-100    ",
   '-+0 ', "8.*", "+00     ", "+01     ", "+100    ", "-100    ",
      '#', "8.*", "      00", "    0b01", "   0b100", "  -0b100",
     '# ', "8.*", "      00", "    0b01", "   0b100", "  -0b100",
     '#0', "8.*", "      00", "    0b01", "   0b100", "  -0b100",
    '#0 ', "8.*", "      00", "    0b01", "   0b100", "  -0b100",
     '#+', "8.*", "     +00", "   +0b01", "  +0b100", "  -0b100",
    '#+ ', "8.*", "     +00", "   +0b01", "  +0b100", "  -0b100",
    '#+0', "8.*", "     +00", "   +0b01", "  +0b100", "  -0b100",
   '#+0 ', "8.*", "     +00", "   +0b01", "  +0b100", "  -0b100",
     '#-', "8.*", "00      ", "0b01    ", "0b100   ", "-0b100  ",
    '#-+', "8.*", "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",
    '#- ', "8.*", " 00     ", " 0b01   ", " 0b100  ", "-0b100  ",
   '#-+ ', "8.*", "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",
    '#-0', "8.*", "00      ", "0b01    ", "0b100   ", "-0b100  ",
   '#-+0', "8.*", "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",
   '#-0 ', "8.*", " 00     ", " 0b01   ", " 0b100  ", "-0b100  ",
  '#-+0 ', "8.*", "+00     ", "+0b01   ", "+0b100  ", "-0b100  ",

).map: -> $flags, $size, $r0, $r1, $r4, $rm {
    my @flat;
    @flat.append(
      '%' ~ $_ ~ $size ~ 'b',
      ($r0 => (2,0), $r1 => (2,1), $r4 => (2,4), $rm => (2,-4))
   ) for $flags.comb.permutations>>.join;
   |@flat
} );

plan @info/2;

for @info -> $format, @tests {
    subtest {
        plan 2 * @tests;

        for @tests {
            is-deeply sprintf($format, |.value), .key,
              qq/sprintf("$format",{.value.list.join(",")}) eq '{.key}'/;
            is-deeply sprintf($format.uc, |.value), .key.uc,
              qq/sprintf("{$format.uc}",{.value.list.join(",")}) eq '{.key.uc}'/;
        }
    }, "Tested '$format'";
}

# vim: expandtab shiftwidth=4

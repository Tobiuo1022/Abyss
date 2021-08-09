use v6;
# Unicode normalization tests, generated from NormalizationTests.txt in the
# Unicode database by S15-normalization/test-gen.p6.
# Generated from Unicode version 13.0.0.

use Test;

plan 500;

ok Uni.new(0x1E0A, 0x0323).NFKC.list ~~ (0x1E0C, 0x0307,), '1E0A 0323 -> 1E0C 0307';
ok Uni.new(0x0044, 0x0307, 0x0323).NFKC.list ~~ (0x1E0C, 0x0307,), '0044 0307 0323 -> 1E0C 0307';
ok Uni.new(0x0044, 0x0323, 0x0307).NFKC.list ~~ (0x1E0C, 0x0307,), '0044 0323 0307 -> 1E0C 0307';
ok Uni.new(0x1E0A, 0x031B).NFKC.list ~~ (0x1E0A, 0x031B,), '1E0A 031B -> 1E0A 031B';
ok Uni.new(0x1E0A, 0x031B, 0x0323).NFKC.list ~~ (0x1E0C, 0x031B, 0x0307,), '1E0A 031B 0323 -> 1E0C 031B 0307';
ok Uni.new(0x0044, 0x031B, 0x0307, 0x0323).NFKC.list ~~ (0x1E0C, 0x031B, 0x0307,), '0044 031B 0307 0323 -> 1E0C 031B 0307';
ok Uni.new(0x0044, 0x031B, 0x0323, 0x0307).NFKC.list ~~ (0x1E0C, 0x031B, 0x0307,), '0044 031B 0323 0307 -> 1E0C 031B 0307';
ok Uni.new(0x00C8).NFKC.list ~~ (0x00C8,), '00C8 -> 00C8';
ok Uni.new(0x0045, 0x0300).NFKC.list ~~ (0x00C8,), '0045 0300 -> 00C8';
ok Uni.new(0x0045, 0x0304).NFKC.list ~~ (0x0112,), '0045 0304 -> 0112';
ok Uni.new(0x0112, 0x0300).NFKC.list ~~ (0x1E14,), '0112 0300 -> 1E14';
ok Uni.new(0x1E14, 0x0304).NFKC.list ~~ (0x1E14, 0x0304,), '1E14 0304 -> 1E14 0304';
ok Uni.new(0x0045, 0x0304, 0x0300).NFKC.list ~~ (0x1E14,), '0045 0304 0300 -> 1E14';
ok Uni.new(0x0045, 0x0300, 0x0304).NFKC.list ~~ (0x00C8, 0x0304,), '0045 0300 0304 -> 00C8 0304';
ok Uni.new(0x05B8, 0x05B9, 0x05B1, 0x0591, 0x05C3, 0x05B0, 0x05AC, 0x059F).NFKC.list ~~ (0x05B1, 0x05B8, 0x05B9, 0x0591, 0x05C3, 0x05B0, 0x05AC, 0x059F,), '05B8 05B9 05B1 0591 05C3 05B0 05AC 059F -> 05B1 05B8 05B9 0591 05C3 05B0 05AC 059F';
ok Uni.new(0x0592, 0x05B7, 0x05BC, 0x05A5, 0x05B0, 0x05C0, 0x05C4, 0x05AD).NFKC.list ~~ (0x05B0, 0x05B7, 0x05BC, 0x05A5, 0x0592, 0x05C0, 0x05AD, 0x05C4,), '0592 05B7 05BC 05A5 05B0 05C0 05C4 05AD -> 05B0 05B7 05BC 05A5 0592 05C0 05AD 05C4';
ok Uni.new(0x1100, 0xAC00, 0x11A8).NFKC.list ~~ (0x1100, 0xAC01,), '1100 AC00 11A8 -> 1100 AC01';
ok Uni.new(0x1100, 0xAC00, 0x11A8, 0x11A8).NFKC.list ~~ (0x1100, 0xAC01, 0x11A8,), '1100 AC00 11A8 11A8 -> 1100 AC01 11A8';
ok Uni.new(0x00A0).NFKC.list ~~ (0x0020,), '00A0 -> 0020';
ok Uni.new(0x00A8).NFKC.list ~~ (0x0020, 0x0308,), '00A8 -> 0020 0308';
ok Uni.new(0x00AA).NFKC.list ~~ (0x0061,), '00AA -> 0061';
ok Uni.new(0x00AF).NFKC.list ~~ (0x0020, 0x0304,), '00AF -> 0020 0304';
ok Uni.new(0x00B2).NFKC.list ~~ (0x0032,), '00B2 -> 0032';
ok Uni.new(0x00B3).NFKC.list ~~ (0x0033,), '00B3 -> 0033';
ok Uni.new(0x00B4).NFKC.list ~~ (0x0020, 0x0301,), '00B4 -> 0020 0301';
ok Uni.new(0x00B5).NFKC.list ~~ (0x03BC,), '00B5 -> 03BC';
ok Uni.new(0x00B8).NFKC.list ~~ (0x0020, 0x0327,), '00B8 -> 0020 0327';
ok Uni.new(0x00B9).NFKC.list ~~ (0x0031,), '00B9 -> 0031';
ok Uni.new(0x00BA).NFKC.list ~~ (0x006F,), '00BA -> 006F';
ok Uni.new(0x00BC).NFKC.list ~~ (0x0031, 0x2044, 0x0034,), '00BC -> 0031 2044 0034';
ok Uni.new(0x00BD).NFKC.list ~~ (0x0031, 0x2044, 0x0032,), '00BD -> 0031 2044 0032';
ok Uni.new(0x00BE).NFKC.list ~~ (0x0033, 0x2044, 0x0034,), '00BE -> 0033 2044 0034';
ok Uni.new(0x00C0).NFKC.list ~~ (0x00C0,), '00C0 -> 00C0';
ok Uni.new(0x00C1).NFKC.list ~~ (0x00C1,), '00C1 -> 00C1';
ok Uni.new(0x00C2).NFKC.list ~~ (0x00C2,), '00C2 -> 00C2';
ok Uni.new(0x00C3).NFKC.list ~~ (0x00C3,), '00C3 -> 00C3';
ok Uni.new(0x00C4).NFKC.list ~~ (0x00C4,), '00C4 -> 00C4';
ok Uni.new(0x00C5).NFKC.list ~~ (0x00C5,), '00C5 -> 00C5';
ok Uni.new(0x0132).NFKC.list ~~ (0x0049, 0x004A,), '0132 -> 0049 004A';
ok Uni.new(0x0133).NFKC.list ~~ (0x0069, 0x006A,), '0133 -> 0069 006A';
ok Uni.new(0x0134).NFKC.list ~~ (0x0134,), '0134 -> 0134';
ok Uni.new(0x013F).NFKC.list ~~ (0x004C, 0x00B7,), '013F -> 004C 00B7';
ok Uni.new(0x0140).NFKC.list ~~ (0x006C, 0x00B7,), '0140 -> 006C 00B7';
ok Uni.new(0x0143).NFKC.list ~~ (0x0143,), '0143 -> 0143';
ok Uni.new(0x0149).NFKC.list ~~ (0x02BC, 0x006E,), '0149 -> 02BC 006E';
ok Uni.new(0x017F).NFKC.list ~~ (0x0073,), '017F -> 0073';
ok Uni.new(0x01C4).NFKC.list ~~ (0x0044, 0x017D,), '01C4 -> 0044 017D';
ok Uni.new(0x01C5).NFKC.list ~~ (0x0044, 0x017E,), '01C5 -> 0044 017E';
ok Uni.new(0x01C6).NFKC.list ~~ (0x0064, 0x017E,), '01C6 -> 0064 017E';
ok Uni.new(0x01C7).NFKC.list ~~ (0x004C, 0x004A,), '01C7 -> 004C 004A';
ok Uni.new(0x01C8).NFKC.list ~~ (0x004C, 0x006A,), '01C8 -> 004C 006A';
ok Uni.new(0x01C9).NFKC.list ~~ (0x006C, 0x006A,), '01C9 -> 006C 006A';
ok Uni.new(0x01CA).NFKC.list ~~ (0x004E, 0x004A,), '01CA -> 004E 004A';
ok Uni.new(0x01CB).NFKC.list ~~ (0x004E, 0x006A,), '01CB -> 004E 006A';
ok Uni.new(0x01CC).NFKC.list ~~ (0x006E, 0x006A,), '01CC -> 006E 006A';
ok Uni.new(0x01CD).NFKC.list ~~ (0x01CD,), '01CD -> 01CD';
ok Uni.new(0x01CE).NFKC.list ~~ (0x01CE,), '01CE -> 01CE';
ok Uni.new(0x01CF).NFKC.list ~~ (0x01CF,), '01CF -> 01CF';
ok Uni.new(0x01F1).NFKC.list ~~ (0x0044, 0x005A,), '01F1 -> 0044 005A';
ok Uni.new(0x01F2).NFKC.list ~~ (0x0044, 0x007A,), '01F2 -> 0044 007A';
ok Uni.new(0x01F3).NFKC.list ~~ (0x0064, 0x007A,), '01F3 -> 0064 007A';
ok Uni.new(0x01F4).NFKC.list ~~ (0x01F4,), '01F4 -> 01F4';
ok Uni.new(0x02B0).NFKC.list ~~ (0x0068,), '02B0 -> 0068';
ok Uni.new(0x02B1).NFKC.list ~~ (0x0266,), '02B1 -> 0266';
ok Uni.new(0x02B2).NFKC.list ~~ (0x006A,), '02B2 -> 006A';
ok Uni.new(0x02B3).NFKC.list ~~ (0x0072,), '02B3 -> 0072';
ok Uni.new(0x02B4).NFKC.list ~~ (0x0279,), '02B4 -> 0279';
ok Uni.new(0x02B5).NFKC.list ~~ (0x027B,), '02B5 -> 027B';
ok Uni.new(0x02B6).NFKC.list ~~ (0x0281,), '02B6 -> 0281';
ok Uni.new(0x02B7).NFKC.list ~~ (0x0077,), '02B7 -> 0077';
ok Uni.new(0x02B8).NFKC.list ~~ (0x0079,), '02B8 -> 0079';
ok Uni.new(0x02D8).NFKC.list ~~ (0x0020, 0x0306,), '02D8 -> 0020 0306';
ok Uni.new(0x02D9).NFKC.list ~~ (0x0020, 0x0307,), '02D9 -> 0020 0307';
ok Uni.new(0x02DA).NFKC.list ~~ (0x0020, 0x030A,), '02DA -> 0020 030A';
ok Uni.new(0x02DB).NFKC.list ~~ (0x0020, 0x0328,), '02DB -> 0020 0328';
ok Uni.new(0x02DC).NFKC.list ~~ (0x0020, 0x0303,), '02DC -> 0020 0303';
ok Uni.new(0x02DD).NFKC.list ~~ (0x0020, 0x030B,), '02DD -> 0020 030B';
ok Uni.new(0x02E0).NFKC.list ~~ (0x0263,), '02E0 -> 0263';
ok Uni.new(0x02E1).NFKC.list ~~ (0x006C,), '02E1 -> 006C';
ok Uni.new(0x02E2).NFKC.list ~~ (0x0073,), '02E2 -> 0073';
ok Uni.new(0x02E3).NFKC.list ~~ (0x0078,), '02E3 -> 0078';
ok Uni.new(0x02E4).NFKC.list ~~ (0x0295,), '02E4 -> 0295';
ok Uni.new(0x0340).NFKC.list ~~ (0x0300,), '0340 -> 0300';
ok Uni.new(0x0341).NFKC.list ~~ (0x0301,), '0341 -> 0301';
ok Uni.new(0x0343).NFKC.list ~~ (0x0313,), '0343 -> 0313';
ok Uni.new(0x0344).NFKC.list ~~ (0x0308, 0x0301,), '0344 -> 0308 0301';
ok Uni.new(0x0374).NFKC.list ~~ (0x02B9,), '0374 -> 02B9';
ok Uni.new(0x037A).NFKC.list ~~ (0x0020, 0x0345,), '037A -> 0020 0345';
ok Uni.new(0x037E).NFKC.list ~~ (0x003B,), '037E -> 003B';
ok Uni.new(0x0384).NFKC.list ~~ (0x0020, 0x0301,), '0384 -> 0020 0301';
ok Uni.new(0x0385).NFKC.list ~~ (0x0020, 0x0308, 0x0301,), '0385 -> 0020 0308 0301';
ok Uni.new(0x0386).NFKC.list ~~ (0x0386,), '0386 -> 0386';
ok Uni.new(0x0387).NFKC.list ~~ (0x00B7,), '0387 -> 00B7';
ok Uni.new(0x0388).NFKC.list ~~ (0x0388,), '0388 -> 0388';
ok Uni.new(0x0389).NFKC.list ~~ (0x0389,), '0389 -> 0389';
ok Uni.new(0x038A).NFKC.list ~~ (0x038A,), '038A -> 038A';
ok Uni.new(0x038C).NFKC.list ~~ (0x038C,), '038C -> 038C';
ok Uni.new(0x038E).NFKC.list ~~ (0x038E,), '038E -> 038E';
ok Uni.new(0x038F).NFKC.list ~~ (0x038F,), '038F -> 038F';
ok Uni.new(0x0390).NFKC.list ~~ (0x0390,), '0390 -> 0390';
ok Uni.new(0x03AA).NFKC.list ~~ (0x03AA,), '03AA -> 03AA';
ok Uni.new(0x03AB).NFKC.list ~~ (0x03AB,), '03AB -> 03AB';
ok Uni.new(0x03D0).NFKC.list ~~ (0x03B2,), '03D0 -> 03B2';
ok Uni.new(0x03D1).NFKC.list ~~ (0x03B8,), '03D1 -> 03B8';
ok Uni.new(0x03D2).NFKC.list ~~ (0x03A5,), '03D2 -> 03A5';
ok Uni.new(0x03D3).NFKC.list ~~ (0x038E,), '03D3 -> 038E';
ok Uni.new(0x03D4).NFKC.list ~~ (0x03AB,), '03D4 -> 03AB';
ok Uni.new(0x03D5).NFKC.list ~~ (0x03C6,), '03D5 -> 03C6';
ok Uni.new(0x03D6).NFKC.list ~~ (0x03C0,), '03D6 -> 03C0';
ok Uni.new(0x03F0).NFKC.list ~~ (0x03BA,), '03F0 -> 03BA';
ok Uni.new(0x03F1).NFKC.list ~~ (0x03C1,), '03F1 -> 03C1';
ok Uni.new(0x03F2).NFKC.list ~~ (0x03C2,), '03F2 -> 03C2';
ok Uni.new(0x03F4).NFKC.list ~~ (0x0398,), '03F4 -> 0398';
ok Uni.new(0x03F5).NFKC.list ~~ (0x03B5,), '03F5 -> 03B5';
ok Uni.new(0x03F9).NFKC.list ~~ (0x03A3,), '03F9 -> 03A3';
ok Uni.new(0x0400).NFKC.list ~~ (0x0400,), '0400 -> 0400';
ok Uni.new(0x0401).NFKC.list ~~ (0x0401,), '0401 -> 0401';
ok Uni.new(0x0403).NFKC.list ~~ (0x0403,), '0403 -> 0403';
ok Uni.new(0x0407).NFKC.list ~~ (0x0407,), '0407 -> 0407';
ok Uni.new(0x040C).NFKC.list ~~ (0x040C,), '040C -> 040C';
ok Uni.new(0x0587).NFKC.list ~~ (0x0565, 0x0582,), '0587 -> 0565 0582';
ok Uni.new(0x0675).NFKC.list ~~ (0x0627, 0x0674,), '0675 -> 0627 0674';
ok Uni.new(0x0676).NFKC.list ~~ (0x0648, 0x0674,), '0676 -> 0648 0674';
ok Uni.new(0x0677).NFKC.list ~~ (0x06C7, 0x0674,), '0677 -> 06C7 0674';
ok Uni.new(0x0678).NFKC.list ~~ (0x064A, 0x0674,), '0678 -> 064A 0674';
ok Uni.new(0x06C0).NFKC.list ~~ (0x06C0,), '06C0 -> 06C0';
ok Uni.new(0x0958).NFKC.list ~~ (0x0915, 0x093C,), '0958 -> 0915 093C';
ok Uni.new(0x0959).NFKC.list ~~ (0x0916, 0x093C,), '0959 -> 0916 093C';
ok Uni.new(0x095A).NFKC.list ~~ (0x0917, 0x093C,), '095A -> 0917 093C';
ok Uni.new(0x095B).NFKC.list ~~ (0x091C, 0x093C,), '095B -> 091C 093C';
ok Uni.new(0x095C).NFKC.list ~~ (0x0921, 0x093C,), '095C -> 0921 093C';
ok Uni.new(0x095D).NFKC.list ~~ (0x0922, 0x093C,), '095D -> 0922 093C';
ok Uni.new(0x095E).NFKC.list ~~ (0x092B, 0x093C,), '095E -> 092B 093C';
ok Uni.new(0x095F).NFKC.list ~~ (0x092F, 0x093C,), '095F -> 092F 093C';
ok Uni.new(0x09CB).NFKC.list ~~ (0x09CB,), '09CB -> 09CB';
ok Uni.new(0x09CC).NFKC.list ~~ (0x09CC,), '09CC -> 09CC';
ok Uni.new(0x09DC).NFKC.list ~~ (0x09A1, 0x09BC,), '09DC -> 09A1 09BC';
ok Uni.new(0x09DD).NFKC.list ~~ (0x09A2, 0x09BC,), '09DD -> 09A2 09BC';
ok Uni.new(0x09DF).NFKC.list ~~ (0x09AF, 0x09BC,), '09DF -> 09AF 09BC';
ok Uni.new(0x0A33).NFKC.list ~~ (0x0A32, 0x0A3C,), '0A33 -> 0A32 0A3C';
ok Uni.new(0x0A36).NFKC.list ~~ (0x0A38, 0x0A3C,), '0A36 -> 0A38 0A3C';
ok Uni.new(0x0A59).NFKC.list ~~ (0x0A16, 0x0A3C,), '0A59 -> 0A16 0A3C';
ok Uni.new(0x0A5A).NFKC.list ~~ (0x0A17, 0x0A3C,), '0A5A -> 0A17 0A3C';
ok Uni.new(0x0A5B).NFKC.list ~~ (0x0A1C, 0x0A3C,), '0A5B -> 0A1C 0A3C';
ok Uni.new(0x0A5E).NFKC.list ~~ (0x0A2B, 0x0A3C,), '0A5E -> 0A2B 0A3C';
ok Uni.new(0x0B48).NFKC.list ~~ (0x0B48,), '0B48 -> 0B48';
ok Uni.new(0x0B4B).NFKC.list ~~ (0x0B4B,), '0B4B -> 0B4B';
ok Uni.new(0x0B4C).NFKC.list ~~ (0x0B4C,), '0B4C -> 0B4C';
ok Uni.new(0x0B5C).NFKC.list ~~ (0x0B21, 0x0B3C,), '0B5C -> 0B21 0B3C';
ok Uni.new(0x0B5D).NFKC.list ~~ (0x0B22, 0x0B3C,), '0B5D -> 0B22 0B3C';
ok Uni.new(0x0B94).NFKC.list ~~ (0x0B94,), '0B94 -> 0B94';
ok Uni.new(0x0BCA).NFKC.list ~~ (0x0BCA,), '0BCA -> 0BCA';
ok Uni.new(0x0E33).NFKC.list ~~ (0x0E4D, 0x0E32,), '0E33 -> 0E4D 0E32';
ok Uni.new(0x0EB3).NFKC.list ~~ (0x0ECD, 0x0EB2,), '0EB3 -> 0ECD 0EB2';
ok Uni.new(0x0EDC).NFKC.list ~~ (0x0EAB, 0x0E99,), '0EDC -> 0EAB 0E99';
ok Uni.new(0x0EDD).NFKC.list ~~ (0x0EAB, 0x0EA1,), '0EDD -> 0EAB 0EA1';
ok Uni.new(0x0F0C).NFKC.list ~~ (0x0F0B,), '0F0C -> 0F0B';
ok Uni.new(0x0F43).NFKC.list ~~ (0x0F42, 0x0FB7,), '0F43 -> 0F42 0FB7';
ok Uni.new(0x0F4D).NFKC.list ~~ (0x0F4C, 0x0FB7,), '0F4D -> 0F4C 0FB7';
ok Uni.new(0x0F52).NFKC.list ~~ (0x0F51, 0x0FB7,), '0F52 -> 0F51 0FB7';
ok Uni.new(0x0F57).NFKC.list ~~ (0x0F56, 0x0FB7,), '0F57 -> 0F56 0FB7';
ok Uni.new(0x0F5C).NFKC.list ~~ (0x0F5B, 0x0FB7,), '0F5C -> 0F5B 0FB7';
ok Uni.new(0x0F69).NFKC.list ~~ (0x0F40, 0x0FB5,), '0F69 -> 0F40 0FB5';
ok Uni.new(0x0F73).NFKC.list ~~ (0x0F71, 0x0F72,), '0F73 -> 0F71 0F72';
ok Uni.new(0x0F75).NFKC.list ~~ (0x0F71, 0x0F74,), '0F75 -> 0F71 0F74';
ok Uni.new(0x0F76).NFKC.list ~~ (0x0FB2, 0x0F80,), '0F76 -> 0FB2 0F80';
ok Uni.new(0x0F77).NFKC.list ~~ (0x0FB2, 0x0F71, 0x0F80,), '0F77 -> 0FB2 0F71 0F80';
ok Uni.new(0x0F78).NFKC.list ~~ (0x0FB3, 0x0F80,), '0F78 -> 0FB3 0F80';
ok Uni.new(0x0F79).NFKC.list ~~ (0x0FB3, 0x0F71, 0x0F80,), '0F79 -> 0FB3 0F71 0F80';
ok Uni.new(0x0F81).NFKC.list ~~ (0x0F71, 0x0F80,), '0F81 -> 0F71 0F80';
ok Uni.new(0x0F93).NFKC.list ~~ (0x0F92, 0x0FB7,), '0F93 -> 0F92 0FB7';
ok Uni.new(0x0F9D).NFKC.list ~~ (0x0F9C, 0x0FB7,), '0F9D -> 0F9C 0FB7';
ok Uni.new(0x0FA2).NFKC.list ~~ (0x0FA1, 0x0FB7,), '0FA2 -> 0FA1 0FB7';
ok Uni.new(0x0FA7).NFKC.list ~~ (0x0FA6, 0x0FB7,), '0FA7 -> 0FA6 0FB7';
ok Uni.new(0x0FAC).NFKC.list ~~ (0x0FAB, 0x0FB7,), '0FAC -> 0FAB 0FB7';
ok Uni.new(0x0FB9).NFKC.list ~~ (0x0F90, 0x0FB5,), '0FB9 -> 0F90 0FB5';
ok Uni.new(0x1026).NFKC.list ~~ (0x1026,), '1026 -> 1026';
ok Uni.new(0x10FC).NFKC.list ~~ (0x10DC,), '10FC -> 10DC';
ok Uni.new(0x1B06).NFKC.list ~~ (0x1B06,), '1B06 -> 1B06';
ok Uni.new(0x1B08).NFKC.list ~~ (0x1B08,), '1B08 -> 1B08';
ok Uni.new(0x1B0A).NFKC.list ~~ (0x1B0A,), '1B0A -> 1B0A';
ok Uni.new(0x1B0C).NFKC.list ~~ (0x1B0C,), '1B0C -> 1B0C';
ok Uni.new(0x1B0E).NFKC.list ~~ (0x1B0E,), '1B0E -> 1B0E';
ok Uni.new(0x1B12).NFKC.list ~~ (0x1B12,), '1B12 -> 1B12';
ok Uni.new(0x1B3B).NFKC.list ~~ (0x1B3B,), '1B3B -> 1B3B';
ok Uni.new(0x1D2C).NFKC.list ~~ (0x0041,), '1D2C -> 0041';
ok Uni.new(0x1D2D).NFKC.list ~~ (0x00C6,), '1D2D -> 00C6';
ok Uni.new(0x1D2E).NFKC.list ~~ (0x0042,), '1D2E -> 0042';
ok Uni.new(0x1D30).NFKC.list ~~ (0x0044,), '1D30 -> 0044';
ok Uni.new(0x1D31).NFKC.list ~~ (0x0045,), '1D31 -> 0045';
ok Uni.new(0x1D32).NFKC.list ~~ (0x018E,), '1D32 -> 018E';
ok Uni.new(0x1D33).NFKC.list ~~ (0x0047,), '1D33 -> 0047';
ok Uni.new(0x1D34).NFKC.list ~~ (0x0048,), '1D34 -> 0048';
ok Uni.new(0x1D35).NFKC.list ~~ (0x0049,), '1D35 -> 0049';
ok Uni.new(0x1D36).NFKC.list ~~ (0x004A,), '1D36 -> 004A';
ok Uni.new(0x1D37).NFKC.list ~~ (0x004B,), '1D37 -> 004B';
ok Uni.new(0x1D38).NFKC.list ~~ (0x004C,), '1D38 -> 004C';
ok Uni.new(0x1D39).NFKC.list ~~ (0x004D,), '1D39 -> 004D';
ok Uni.new(0x1D3A).NFKC.list ~~ (0x004E,), '1D3A -> 004E';
ok Uni.new(0x1D3C).NFKC.list ~~ (0x004F,), '1D3C -> 004F';
ok Uni.new(0x1D3D).NFKC.list ~~ (0x0222,), '1D3D -> 0222';
ok Uni.new(0x1D3E).NFKC.list ~~ (0x0050,), '1D3E -> 0050';
ok Uni.new(0x1D3F).NFKC.list ~~ (0x0052,), '1D3F -> 0052';
ok Uni.new(0x1D40).NFKC.list ~~ (0x0054,), '1D40 -> 0054';
ok Uni.new(0x1D41).NFKC.list ~~ (0x0055,), '1D41 -> 0055';
ok Uni.new(0x1D42).NFKC.list ~~ (0x0057,), '1D42 -> 0057';
ok Uni.new(0x1D43).NFKC.list ~~ (0x0061,), '1D43 -> 0061';
ok Uni.new(0x1D44).NFKC.list ~~ (0x0250,), '1D44 -> 0250';
ok Uni.new(0x1D45).NFKC.list ~~ (0x0251,), '1D45 -> 0251';
ok Uni.new(0x1D46).NFKC.list ~~ (0x1D02,), '1D46 -> 1D02';
ok Uni.new(0x1D47).NFKC.list ~~ (0x0062,), '1D47 -> 0062';
ok Uni.new(0x1D48).NFKC.list ~~ (0x0064,), '1D48 -> 0064';
ok Uni.new(0x1D49).NFKC.list ~~ (0x0065,), '1D49 -> 0065';
ok Uni.new(0x1D4A).NFKC.list ~~ (0x0259,), '1D4A -> 0259';
ok Uni.new(0x1D4B).NFKC.list ~~ (0x025B,), '1D4B -> 025B';
ok Uni.new(0x1D4C).NFKC.list ~~ (0x025C,), '1D4C -> 025C';
ok Uni.new(0x1D4D).NFKC.list ~~ (0x0067,), '1D4D -> 0067';
ok Uni.new(0x1D4F).NFKC.list ~~ (0x006B,), '1D4F -> 006B';
ok Uni.new(0x1D50).NFKC.list ~~ (0x006D,), '1D50 -> 006D';
ok Uni.new(0x1D51).NFKC.list ~~ (0x014B,), '1D51 -> 014B';
ok Uni.new(0x1D52).NFKC.list ~~ (0x006F,), '1D52 -> 006F';
ok Uni.new(0x1D53).NFKC.list ~~ (0x0254,), '1D53 -> 0254';
ok Uni.new(0x1D54).NFKC.list ~~ (0x1D16,), '1D54 -> 1D16';
ok Uni.new(0x1D55).NFKC.list ~~ (0x1D17,), '1D55 -> 1D17';
ok Uni.new(0x1D56).NFKC.list ~~ (0x0070,), '1D56 -> 0070';
ok Uni.new(0x1D57).NFKC.list ~~ (0x0074,), '1D57 -> 0074';
ok Uni.new(0x1D58).NFKC.list ~~ (0x0075,), '1D58 -> 0075';
ok Uni.new(0x1D59).NFKC.list ~~ (0x1D1D,), '1D59 -> 1D1D';
ok Uni.new(0x1D5A).NFKC.list ~~ (0x026F,), '1D5A -> 026F';
ok Uni.new(0x1D5B).NFKC.list ~~ (0x0076,), '1D5B -> 0076';
ok Uni.new(0x1D5C).NFKC.list ~~ (0x1D25,), '1D5C -> 1D25';
ok Uni.new(0x1D5D).NFKC.list ~~ (0x03B2,), '1D5D -> 03B2';
ok Uni.new(0x1D5E).NFKC.list ~~ (0x03B3,), '1D5E -> 03B3';
ok Uni.new(0x1D5F).NFKC.list ~~ (0x03B4,), '1D5F -> 03B4';
ok Uni.new(0x1D60).NFKC.list ~~ (0x03C6,), '1D60 -> 03C6';
ok Uni.new(0x1D61).NFKC.list ~~ (0x03C7,), '1D61 -> 03C7';
ok Uni.new(0x1D62).NFKC.list ~~ (0x0069,), '1D62 -> 0069';
ok Uni.new(0x1D63).NFKC.list ~~ (0x0072,), '1D63 -> 0072';
ok Uni.new(0x1D64).NFKC.list ~~ (0x0075,), '1D64 -> 0075';
ok Uni.new(0x1D65).NFKC.list ~~ (0x0076,), '1D65 -> 0076';
ok Uni.new(0x1D66).NFKC.list ~~ (0x03B2,), '1D66 -> 03B2';
ok Uni.new(0x1D67).NFKC.list ~~ (0x03B3,), '1D67 -> 03B3';
ok Uni.new(0x1D68).NFKC.list ~~ (0x03C1,), '1D68 -> 03C1';
ok Uni.new(0x1D69).NFKC.list ~~ (0x03C6,), '1D69 -> 03C6';
ok Uni.new(0x1D6A).NFKC.list ~~ (0x03C7,), '1D6A -> 03C7';
ok Uni.new(0x1D78).NFKC.list ~~ (0x043D,), '1D78 -> 043D';
ok Uni.new(0x1D9B).NFKC.list ~~ (0x0252,), '1D9B -> 0252';
ok Uni.new(0x1D9C).NFKC.list ~~ (0x0063,), '1D9C -> 0063';
ok Uni.new(0x1D9D).NFKC.list ~~ (0x0255,), '1D9D -> 0255';
ok Uni.new(0x1D9E).NFKC.list ~~ (0x00F0,), '1D9E -> 00F0';
ok Uni.new(0x1D9F).NFKC.list ~~ (0x025C,), '1D9F -> 025C';
ok Uni.new(0x1DA0).NFKC.list ~~ (0x0066,), '1DA0 -> 0066';
ok Uni.new(0x1DA1).NFKC.list ~~ (0x025F,), '1DA1 -> 025F';
ok Uni.new(0x1DA2).NFKC.list ~~ (0x0261,), '1DA2 -> 0261';
ok Uni.new(0x1DA3).NFKC.list ~~ (0x0265,), '1DA3 -> 0265';
ok Uni.new(0x1DA4).NFKC.list ~~ (0x0268,), '1DA4 -> 0268';
ok Uni.new(0x1DA5).NFKC.list ~~ (0x0269,), '1DA5 -> 0269';
ok Uni.new(0x1DA6).NFKC.list ~~ (0x026A,), '1DA6 -> 026A';
ok Uni.new(0x1DA7).NFKC.list ~~ (0x1D7B,), '1DA7 -> 1D7B';
ok Uni.new(0x1DA8).NFKC.list ~~ (0x029D,), '1DA8 -> 029D';
ok Uni.new(0x1DA9).NFKC.list ~~ (0x026D,), '1DA9 -> 026D';
ok Uni.new(0x1DAA).NFKC.list ~~ (0x1D85,), '1DAA -> 1D85';
ok Uni.new(0x1DAB).NFKC.list ~~ (0x029F,), '1DAB -> 029F';
ok Uni.new(0x1DAC).NFKC.list ~~ (0x0271,), '1DAC -> 0271';
ok Uni.new(0x1DAD).NFKC.list ~~ (0x0270,), '1DAD -> 0270';
ok Uni.new(0x1DAE).NFKC.list ~~ (0x0272,), '1DAE -> 0272';
ok Uni.new(0x1DAF).NFKC.list ~~ (0x0273,), '1DAF -> 0273';
ok Uni.new(0x1DB0).NFKC.list ~~ (0x0274,), '1DB0 -> 0274';
ok Uni.new(0x1DB1).NFKC.list ~~ (0x0275,), '1DB1 -> 0275';
ok Uni.new(0x1DB2).NFKC.list ~~ (0x0278,), '1DB2 -> 0278';
ok Uni.new(0x1DB3).NFKC.list ~~ (0x0282,), '1DB3 -> 0282';
ok Uni.new(0x1DB4).NFKC.list ~~ (0x0283,), '1DB4 -> 0283';
ok Uni.new(0x1DB5).NFKC.list ~~ (0x01AB,), '1DB5 -> 01AB';
ok Uni.new(0x1DB6).NFKC.list ~~ (0x0289,), '1DB6 -> 0289';
ok Uni.new(0x1DB7).NFKC.list ~~ (0x028A,), '1DB7 -> 028A';
ok Uni.new(0x1DB8).NFKC.list ~~ (0x1D1C,), '1DB8 -> 1D1C';
ok Uni.new(0x1DB9).NFKC.list ~~ (0x028B,), '1DB9 -> 028B';
ok Uni.new(0x1DBA).NFKC.list ~~ (0x028C,), '1DBA -> 028C';
ok Uni.new(0x1DBB).NFKC.list ~~ (0x007A,), '1DBB -> 007A';
ok Uni.new(0x1DBC).NFKC.list ~~ (0x0290,), '1DBC -> 0290';
ok Uni.new(0x1DBD).NFKC.list ~~ (0x0291,), '1DBD -> 0291';
ok Uni.new(0x1DBE).NFKC.list ~~ (0x0292,), '1DBE -> 0292';
ok Uni.new(0x1DBF).NFKC.list ~~ (0x03B8,), '1DBF -> 03B8';
ok Uni.new(0x1E00).NFKC.list ~~ (0x1E00,), '1E00 -> 1E00';
ok Uni.new(0x1E01).NFKC.list ~~ (0x1E01,), '1E01 -> 1E01';
ok Uni.new(0x1E02).NFKC.list ~~ (0x1E02,), '1E02 -> 1E02';
ok Uni.new(0x1E03).NFKC.list ~~ (0x1E03,), '1E03 -> 1E03';
ok Uni.new(0x1E04).NFKC.list ~~ (0x1E04,), '1E04 -> 1E04';
ok Uni.new(0x1E05).NFKC.list ~~ (0x1E05,), '1E05 -> 1E05';
ok Uni.new(0x1E06).NFKC.list ~~ (0x1E06,), '1E06 -> 1E06';
ok Uni.new(0x1E07).NFKC.list ~~ (0x1E07,), '1E07 -> 1E07';
ok Uni.new(0x1E08).NFKC.list ~~ (0x1E08,), '1E08 -> 1E08';
ok Uni.new(0x1E09).NFKC.list ~~ (0x1E09,), '1E09 -> 1E09';
ok Uni.new(0x1E0A).NFKC.list ~~ (0x1E0A,), '1E0A -> 1E0A';
ok Uni.new(0x1E0B).NFKC.list ~~ (0x1E0B,), '1E0B -> 1E0B';
ok Uni.new(0x1E0C).NFKC.list ~~ (0x1E0C,), '1E0C -> 1E0C';
ok Uni.new(0x1E0D).NFKC.list ~~ (0x1E0D,), '1E0D -> 1E0D';
ok Uni.new(0x1E0E).NFKC.list ~~ (0x1E0E,), '1E0E -> 1E0E';
ok Uni.new(0x1E0F).NFKC.list ~~ (0x1E0F,), '1E0F -> 1E0F';
ok Uni.new(0x1E10).NFKC.list ~~ (0x1E10,), '1E10 -> 1E10';
ok Uni.new(0x1E11).NFKC.list ~~ (0x1E11,), '1E11 -> 1E11';
ok Uni.new(0x1E12).NFKC.list ~~ (0x1E12,), '1E12 -> 1E12';
ok Uni.new(0x1E13).NFKC.list ~~ (0x1E13,), '1E13 -> 1E13';
ok Uni.new(0x1E14).NFKC.list ~~ (0x1E14,), '1E14 -> 1E14';
ok Uni.new(0x1E15).NFKC.list ~~ (0x1E15,), '1E15 -> 1E15';
ok Uni.new(0x1E16).NFKC.list ~~ (0x1E16,), '1E16 -> 1E16';
ok Uni.new(0x1E17).NFKC.list ~~ (0x1E17,), '1E17 -> 1E17';
ok Uni.new(0x1E18).NFKC.list ~~ (0x1E18,), '1E18 -> 1E18';
ok Uni.new(0x1E19).NFKC.list ~~ (0x1E19,), '1E19 -> 1E19';
ok Uni.new(0x1E1A).NFKC.list ~~ (0x1E1A,), '1E1A -> 1E1A';
ok Uni.new(0x1E1B).NFKC.list ~~ (0x1E1B,), '1E1B -> 1E1B';
ok Uni.new(0x1E1C).NFKC.list ~~ (0x1E1C,), '1E1C -> 1E1C';
ok Uni.new(0x1E1D).NFKC.list ~~ (0x1E1D,), '1E1D -> 1E1D';
ok Uni.new(0x1E1E).NFKC.list ~~ (0x1E1E,), '1E1E -> 1E1E';
ok Uni.new(0x1E1F).NFKC.list ~~ (0x1E1F,), '1E1F -> 1E1F';
ok Uni.new(0x1E20).NFKC.list ~~ (0x1E20,), '1E20 -> 1E20';
ok Uni.new(0x1E9A).NFKC.list ~~ (0x0061, 0x02BE,), '1E9A -> 0061 02BE';
ok Uni.new(0x1E9B).NFKC.list ~~ (0x1E61,), '1E9B -> 1E61';
ok Uni.new(0x1F71).NFKC.list ~~ (0x03AC,), '1F71 -> 03AC';
ok Uni.new(0x1F72).NFKC.list ~~ (0x1F72,), '1F72 -> 1F72';
ok Uni.new(0x1F73).NFKC.list ~~ (0x03AD,), '1F73 -> 03AD';
ok Uni.new(0x1F75).NFKC.list ~~ (0x03AE,), '1F75 -> 03AE';
ok Uni.new(0x1F77).NFKC.list ~~ (0x03AF,), '1F77 -> 03AF';
ok Uni.new(0x1F78).NFKC.list ~~ (0x1F78,), '1F78 -> 1F78';
ok Uni.new(0x1F79).NFKC.list ~~ (0x03CC,), '1F79 -> 03CC';
ok Uni.new(0x1F7B).NFKC.list ~~ (0x03CD,), '1F7B -> 03CD';
ok Uni.new(0x1F7D).NFKC.list ~~ (0x03CE,), '1F7D -> 03CE';
ok Uni.new(0x1F80).NFKC.list ~~ (0x1F80,), '1F80 -> 1F80';
ok Uni.new(0x1FBB).NFKC.list ~~ (0x0386,), '1FBB -> 0386';
ok Uni.new(0x1FBD).NFKC.list ~~ (0x0020, 0x0313,), '1FBD -> 0020 0313';
ok Uni.new(0x1FBE).NFKC.list ~~ (0x03B9,), '1FBE -> 03B9';
ok Uni.new(0x1FBF).NFKC.list ~~ (0x0020, 0x0313,), '1FBF -> 0020 0313';
ok Uni.new(0x1FC0).NFKC.list ~~ (0x0020, 0x0342,), '1FC0 -> 0020 0342';
ok Uni.new(0x1FC1).NFKC.list ~~ (0x0020, 0x0308, 0x0342,), '1FC1 -> 0020 0308 0342';
ok Uni.new(0x1FC2).NFKC.list ~~ (0x1FC2,), '1FC2 -> 1FC2';
ok Uni.new(0x1FC3).NFKC.list ~~ (0x1FC3,), '1FC3 -> 1FC3';
ok Uni.new(0x1FC9).NFKC.list ~~ (0x0388,), '1FC9 -> 0388';
ok Uni.new(0x1FCB).NFKC.list ~~ (0x0389,), '1FCB -> 0389';
ok Uni.new(0x1FCD).NFKC.list ~~ (0x0020, 0x0313, 0x0300,), '1FCD -> 0020 0313 0300';
ok Uni.new(0x1FCE).NFKC.list ~~ (0x0020, 0x0313, 0x0301,), '1FCE -> 0020 0313 0301';
ok Uni.new(0x1FCF).NFKC.list ~~ (0x0020, 0x0313, 0x0342,), '1FCF -> 0020 0313 0342';
ok Uni.new(0x1FD0).NFKC.list ~~ (0x1FD0,), '1FD0 -> 1FD0';
ok Uni.new(0x1FD3).NFKC.list ~~ (0x0390,), '1FD3 -> 0390';
ok Uni.new(0x1FD6).NFKC.list ~~ (0x1FD6,), '1FD6 -> 1FD6';
ok Uni.new(0x1FDB).NFKC.list ~~ (0x038A,), '1FDB -> 038A';
ok Uni.new(0x1FDD).NFKC.list ~~ (0x0020, 0x0314, 0x0300,), '1FDD -> 0020 0314 0300';
ok Uni.new(0x1FDE).NFKC.list ~~ (0x0020, 0x0314, 0x0301,), '1FDE -> 0020 0314 0301';
ok Uni.new(0x1FDF).NFKC.list ~~ (0x0020, 0x0314, 0x0342,), '1FDF -> 0020 0314 0342';
ok Uni.new(0x1FE0).NFKC.list ~~ (0x1FE0,), '1FE0 -> 1FE0';
ok Uni.new(0x1FE3).NFKC.list ~~ (0x03B0,), '1FE3 -> 03B0';
ok Uni.new(0x1FEB).NFKC.list ~~ (0x038E,), '1FEB -> 038E';
ok Uni.new(0x1FEC).NFKC.list ~~ (0x1FEC,), '1FEC -> 1FEC';
ok Uni.new(0x1FED).NFKC.list ~~ (0x0020, 0x0308, 0x0300,), '1FED -> 0020 0308 0300';
ok Uni.new(0x1FEE).NFKC.list ~~ (0x0020, 0x0308, 0x0301,), '1FEE -> 0020 0308 0301';
ok Uni.new(0x1FEF).NFKC.list ~~ (0x0060,), '1FEF -> 0060';
ok Uni.new(0x1FF2).NFKC.list ~~ (0x1FF2,), '1FF2 -> 1FF2';
ok Uni.new(0x1FF9).NFKC.list ~~ (0x038C,), '1FF9 -> 038C';
ok Uni.new(0x1FFB).NFKC.list ~~ (0x038F,), '1FFB -> 038F';
ok Uni.new(0x1FFD).NFKC.list ~~ (0x0020, 0x0301,), '1FFD -> 0020 0301';
ok Uni.new(0x1FFE).NFKC.list ~~ (0x0020, 0x0314,), '1FFE -> 0020 0314';
ok Uni.new(0x2000).NFKC.list ~~ (0x0020,), '2000 -> 0020';
ok Uni.new(0x2001).NFKC.list ~~ (0x0020,), '2001 -> 0020';
ok Uni.new(0x2002).NFKC.list ~~ (0x0020,), '2002 -> 0020';
ok Uni.new(0x2003).NFKC.list ~~ (0x0020,), '2003 -> 0020';
ok Uni.new(0x2004).NFKC.list ~~ (0x0020,), '2004 -> 0020';
ok Uni.new(0x2005).NFKC.list ~~ (0x0020,), '2005 -> 0020';
ok Uni.new(0x2006).NFKC.list ~~ (0x0020,), '2006 -> 0020';
ok Uni.new(0x2007).NFKC.list ~~ (0x0020,), '2007 -> 0020';
ok Uni.new(0x2008).NFKC.list ~~ (0x0020,), '2008 -> 0020';
ok Uni.new(0x2009).NFKC.list ~~ (0x0020,), '2009 -> 0020';
ok Uni.new(0x200A).NFKC.list ~~ (0x0020,), '200A -> 0020';
ok Uni.new(0x2011).NFKC.list ~~ (0x2010,), '2011 -> 2010';
ok Uni.new(0x2017).NFKC.list ~~ (0x0020, 0x0333,), '2017 -> 0020 0333';
ok Uni.new(0x2024).NFKC.list ~~ (0x002E,), '2024 -> 002E';
ok Uni.new(0x2025).NFKC.list ~~ (0x002E, 0x002E,), '2025 -> 002E 002E';
ok Uni.new(0x2026).NFKC.list ~~ (0x002E, 0x002E, 0x002E,), '2026 -> 002E 002E 002E';
ok Uni.new(0x202F).NFKC.list ~~ (0x0020,), '202F -> 0020';
ok Uni.new(0x2033).NFKC.list ~~ (0x2032, 0x2032,), '2033 -> 2032 2032';
ok Uni.new(0x2034).NFKC.list ~~ (0x2032, 0x2032, 0x2032,), '2034 -> 2032 2032 2032';
ok Uni.new(0x2036).NFKC.list ~~ (0x2035, 0x2035,), '2036 -> 2035 2035';
ok Uni.new(0x2037).NFKC.list ~~ (0x2035, 0x2035, 0x2035,), '2037 -> 2035 2035 2035';
ok Uni.new(0x203C).NFKC.list ~~ (0x0021, 0x0021,), '203C -> 0021 0021';
ok Uni.new(0x203E).NFKC.list ~~ (0x0020, 0x0305,), '203E -> 0020 0305';
ok Uni.new(0x2047).NFKC.list ~~ (0x003F, 0x003F,), '2047 -> 003F 003F';
ok Uni.new(0x2048).NFKC.list ~~ (0x003F, 0x0021,), '2048 -> 003F 0021';
ok Uni.new(0x2049).NFKC.list ~~ (0x0021, 0x003F,), '2049 -> 0021 003F';
ok Uni.new(0x2057).NFKC.list ~~ (0x2032, 0x2032, 0x2032, 0x2032,), '2057 -> 2032 2032 2032 2032';
ok Uni.new(0x205F).NFKC.list ~~ (0x0020,), '205F -> 0020';
ok Uni.new(0x2070).NFKC.list ~~ (0x0030,), '2070 -> 0030';
ok Uni.new(0x2071).NFKC.list ~~ (0x0069,), '2071 -> 0069';
ok Uni.new(0x2074).NFKC.list ~~ (0x0034,), '2074 -> 0034';
ok Uni.new(0x2075).NFKC.list ~~ (0x0035,), '2075 -> 0035';
ok Uni.new(0x2076).NFKC.list ~~ (0x0036,), '2076 -> 0036';
ok Uni.new(0x2077).NFKC.list ~~ (0x0037,), '2077 -> 0037';
ok Uni.new(0x2078).NFKC.list ~~ (0x0038,), '2078 -> 0038';
ok Uni.new(0x2079).NFKC.list ~~ (0x0039,), '2079 -> 0039';
ok Uni.new(0x207A).NFKC.list ~~ (0x002B,), '207A -> 002B';
ok Uni.new(0x207B).NFKC.list ~~ (0x2212,), '207B -> 2212';
ok Uni.new(0x207C).NFKC.list ~~ (0x003D,), '207C -> 003D';
ok Uni.new(0x207D).NFKC.list ~~ (0x0028,), '207D -> 0028';
ok Uni.new(0x207E).NFKC.list ~~ (0x0029,), '207E -> 0029';
ok Uni.new(0x207F).NFKC.list ~~ (0x006E,), '207F -> 006E';
ok Uni.new(0x2080).NFKC.list ~~ (0x0030,), '2080 -> 0030';
ok Uni.new(0x2081).NFKC.list ~~ (0x0031,), '2081 -> 0031';
ok Uni.new(0x2082).NFKC.list ~~ (0x0032,), '2082 -> 0032';
ok Uni.new(0x2083).NFKC.list ~~ (0x0033,), '2083 -> 0033';
ok Uni.new(0x2084).NFKC.list ~~ (0x0034,), '2084 -> 0034';
ok Uni.new(0x2085).NFKC.list ~~ (0x0035,), '2085 -> 0035';
ok Uni.new(0x2086).NFKC.list ~~ (0x0036,), '2086 -> 0036';
ok Uni.new(0x2087).NFKC.list ~~ (0x0037,), '2087 -> 0037';
ok Uni.new(0x2088).NFKC.list ~~ (0x0038,), '2088 -> 0038';
ok Uni.new(0x2089).NFKC.list ~~ (0x0039,), '2089 -> 0039';
ok Uni.new(0x208A).NFKC.list ~~ (0x002B,), '208A -> 002B';
ok Uni.new(0x208B).NFKC.list ~~ (0x2212,), '208B -> 2212';
ok Uni.new(0x208C).NFKC.list ~~ (0x003D,), '208C -> 003D';
ok Uni.new(0x208D).NFKC.list ~~ (0x0028,), '208D -> 0028';
ok Uni.new(0x208E).NFKC.list ~~ (0x0029,), '208E -> 0029';
ok Uni.new(0x2090).NFKC.list ~~ (0x0061,), '2090 -> 0061';
ok Uni.new(0x2091).NFKC.list ~~ (0x0065,), '2091 -> 0065';
ok Uni.new(0x2092).NFKC.list ~~ (0x006F,), '2092 -> 006F';
ok Uni.new(0x2093).NFKC.list ~~ (0x0078,), '2093 -> 0078';
ok Uni.new(0x2094).NFKC.list ~~ (0x0259,), '2094 -> 0259';
ok Uni.new(0x2095).NFKC.list ~~ (0x0068,), '2095 -> 0068';
ok Uni.new(0x2096).NFKC.list ~~ (0x006B,), '2096 -> 006B';
ok Uni.new(0x2097).NFKC.list ~~ (0x006C,), '2097 -> 006C';
ok Uni.new(0x2098).NFKC.list ~~ (0x006D,), '2098 -> 006D';
ok Uni.new(0x2099).NFKC.list ~~ (0x006E,), '2099 -> 006E';
ok Uni.new(0x209A).NFKC.list ~~ (0x0070,), '209A -> 0070';
ok Uni.new(0x209B).NFKC.list ~~ (0x0073,), '209B -> 0073';
ok Uni.new(0x209C).NFKC.list ~~ (0x0074,), '209C -> 0074';
ok Uni.new(0x20A8).NFKC.list ~~ (0x0052, 0x0073,), '20A8 -> 0052 0073';
ok Uni.new(0x2100).NFKC.list ~~ (0x0061, 0x002F, 0x0063,), '2100 -> 0061 002F 0063';
ok Uni.new(0x2101).NFKC.list ~~ (0x0061, 0x002F, 0x0073,), '2101 -> 0061 002F 0073';
ok Uni.new(0x2102).NFKC.list ~~ (0x0043,), '2102 -> 0043';
ok Uni.new(0x2103).NFKC.list ~~ (0x00B0, 0x0043,), '2103 -> 00B0 0043';
ok Uni.new(0x2105).NFKC.list ~~ (0x0063, 0x002F, 0x006F,), '2105 -> 0063 002F 006F';
ok Uni.new(0x2106).NFKC.list ~~ (0x0063, 0x002F, 0x0075,), '2106 -> 0063 002F 0075';
ok Uni.new(0x2107).NFKC.list ~~ (0x0190,), '2107 -> 0190';
ok Uni.new(0x2109).NFKC.list ~~ (0x00B0, 0x0046,), '2109 -> 00B0 0046';
ok Uni.new(0x210A).NFKC.list ~~ (0x0067,), '210A -> 0067';
ok Uni.new(0x210B).NFKC.list ~~ (0x0048,), '210B -> 0048';
ok Uni.new(0x210C).NFKC.list ~~ (0x0048,), '210C -> 0048';
ok Uni.new(0x210D).NFKC.list ~~ (0x0048,), '210D -> 0048';
ok Uni.new(0x210E).NFKC.list ~~ (0x0068,), '210E -> 0068';
ok Uni.new(0x210F).NFKC.list ~~ (0x0127,), '210F -> 0127';
ok Uni.new(0x2110).NFKC.list ~~ (0x0049,), '2110 -> 0049';
ok Uni.new(0x2111).NFKC.list ~~ (0x0049,), '2111 -> 0049';
ok Uni.new(0x2112).NFKC.list ~~ (0x004C,), '2112 -> 004C';
ok Uni.new(0x2113).NFKC.list ~~ (0x006C,), '2113 -> 006C';
ok Uni.new(0x2115).NFKC.list ~~ (0x004E,), '2115 -> 004E';
ok Uni.new(0x2116).NFKC.list ~~ (0x004E, 0x006F,), '2116 -> 004E 006F';
ok Uni.new(0x2119).NFKC.list ~~ (0x0050,), '2119 -> 0050';
ok Uni.new(0x211A).NFKC.list ~~ (0x0051,), '211A -> 0051';
ok Uni.new(0x211B).NFKC.list ~~ (0x0052,), '211B -> 0052';
ok Uni.new(0x211C).NFKC.list ~~ (0x0052,), '211C -> 0052';
ok Uni.new(0x211D).NFKC.list ~~ (0x0052,), '211D -> 0052';
ok Uni.new(0x2120).NFKC.list ~~ (0x0053, 0x004D,), '2120 -> 0053 004D';
ok Uni.new(0x2121).NFKC.list ~~ (0x0054, 0x0045, 0x004C,), '2121 -> 0054 0045 004C';
ok Uni.new(0x2122).NFKC.list ~~ (0x0054, 0x004D,), '2122 -> 0054 004D';
ok Uni.new(0x2124).NFKC.list ~~ (0x005A,), '2124 -> 005A';
ok Uni.new(0x2126).NFKC.list ~~ (0x03A9,), '2126 -> 03A9';
ok Uni.new(0x2128).NFKC.list ~~ (0x005A,), '2128 -> 005A';
ok Uni.new(0x212A).NFKC.list ~~ (0x004B,), '212A -> 004B';
ok Uni.new(0x212B).NFKC.list ~~ (0x00C5,), '212B -> 00C5';
ok Uni.new(0x212C).NFKC.list ~~ (0x0042,), '212C -> 0042';
ok Uni.new(0x212D).NFKC.list ~~ (0x0043,), '212D -> 0043';
ok Uni.new(0x212F).NFKC.list ~~ (0x0065,), '212F -> 0065';
ok Uni.new(0x2130).NFKC.list ~~ (0x0045,), '2130 -> 0045';
ok Uni.new(0x2131).NFKC.list ~~ (0x0046,), '2131 -> 0046';
ok Uni.new(0x2133).NFKC.list ~~ (0x004D,), '2133 -> 004D';
ok Uni.new(0x2134).NFKC.list ~~ (0x006F,), '2134 -> 006F';
ok Uni.new(0x2135).NFKC.list ~~ (0x05D0,), '2135 -> 05D0';
ok Uni.new(0x2136).NFKC.list ~~ (0x05D1,), '2136 -> 05D1';
ok Uni.new(0x2137).NFKC.list ~~ (0x05D2,), '2137 -> 05D2';
ok Uni.new(0x2138).NFKC.list ~~ (0x05D3,), '2138 -> 05D3';
ok Uni.new(0x2139).NFKC.list ~~ (0x0069,), '2139 -> 0069';
ok Uni.new(0x213B).NFKC.list ~~ (0x0046, 0x0041, 0x0058,), '213B -> 0046 0041 0058';
ok Uni.new(0x213C).NFKC.list ~~ (0x03C0,), '213C -> 03C0';
ok Uni.new(0x213D).NFKC.list ~~ (0x03B3,), '213D -> 03B3';
ok Uni.new(0x213E).NFKC.list ~~ (0x0393,), '213E -> 0393';
ok Uni.new(0x213F).NFKC.list ~~ (0x03A0,), '213F -> 03A0';
ok Uni.new(0x2140).NFKC.list ~~ (0x2211,), '2140 -> 2211';
ok Uni.new(0x2145).NFKC.list ~~ (0x0044,), '2145 -> 0044';
ok Uni.new(0x2146).NFKC.list ~~ (0x0064,), '2146 -> 0064';
ok Uni.new(0x2147).NFKC.list ~~ (0x0065,), '2147 -> 0065';
ok Uni.new(0x2148).NFKC.list ~~ (0x0069,), '2148 -> 0069';
ok Uni.new(0x2149).NFKC.list ~~ (0x006A,), '2149 -> 006A';
ok Uni.new(0x2150).NFKC.list ~~ (0x0031, 0x2044, 0x0037,), '2150 -> 0031 2044 0037';
ok Uni.new(0x2151).NFKC.list ~~ (0x0031, 0x2044, 0x0039,), '2151 -> 0031 2044 0039';
ok Uni.new(0x2152).NFKC.list ~~ (0x0031, 0x2044, 0x0031, 0x0030,), '2152 -> 0031 2044 0031 0030';
ok Uni.new(0x2153).NFKC.list ~~ (0x0031, 0x2044, 0x0033,), '2153 -> 0031 2044 0033';
ok Uni.new(0x2154).NFKC.list ~~ (0x0032, 0x2044, 0x0033,), '2154 -> 0032 2044 0033';
ok Uni.new(0x2155).NFKC.list ~~ (0x0031, 0x2044, 0x0035,), '2155 -> 0031 2044 0035';
ok Uni.new(0x2156).NFKC.list ~~ (0x0032, 0x2044, 0x0035,), '2156 -> 0032 2044 0035';
ok Uni.new(0x2157).NFKC.list ~~ (0x0033, 0x2044, 0x0035,), '2157 -> 0033 2044 0035';
ok Uni.new(0x2158).NFKC.list ~~ (0x0034, 0x2044, 0x0035,), '2158 -> 0034 2044 0035';
ok Uni.new(0x2159).NFKC.list ~~ (0x0031, 0x2044, 0x0036,), '2159 -> 0031 2044 0036';
ok Uni.new(0x215A).NFKC.list ~~ (0x0035, 0x2044, 0x0036,), '215A -> 0035 2044 0036';
ok Uni.new(0x215B).NFKC.list ~~ (0x0031, 0x2044, 0x0038,), '215B -> 0031 2044 0038';
ok Uni.new(0x215C).NFKC.list ~~ (0x0033, 0x2044, 0x0038,), '215C -> 0033 2044 0038';
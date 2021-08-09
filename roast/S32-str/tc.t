use v6;

use Test;

plan 9;

# L<S32::Str/Str/ucfirst>

is tc("hello world"), "Hello world", "simple";
is tc(""),            "",            "empty string";
is tc("üüüü"),        "Üüüü",        "umlaut";
is tc("óóóó"),        "Óóóó",        "accented chars";
# https://github.com/Raku/old-issue-tracker/issues/3963
is tc('ßß'),          'Ssß',         'sharp s => Ss';
is tc('ǉ'),           'ǈ',           'lj => Lj (in one character)';
is 'abc'.tc,          'Abc',         'method form of title case';
is 'aBcD'.tc,         'ABcD',        'tc only modifies first character';
# https://github.com/Raku/old-issue-tracker/issues/3841
#?rakudo.jvm todo 'NFC/NFG not supported. JVM stores strings in UTF-16 format, but otherwise correct casechange RT#124500'
is "\x1044E\x10427".tc, "\x10426\x10427", 'tc works on codepoints greater than 0xffff';

# vim: expandtab shiftwidth=4

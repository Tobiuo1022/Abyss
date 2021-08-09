use v6;

use Test;

# L<S32::Str/Str/=item length>

=begin pod

Various length tests (though "length" should not be used)

Don't mismatch "length" with the "width" property for Unicode characters.

L<"http://www.unicode.org/unicode/reports/tr11/">

=end pod

plan 29;

throws-like({"moose".length}, X::Method::NotFound, 'Str.length properly unimplemented');

# string literals, for sanity

# L<S32::Str/Str/=item chars>

# Please add test strings in your favorite script, especially if
# it is boustrophedonic or otherwise interesting.
my @stringy = <@stringy>;
my @data = (
    # string            octets codepoints chars
    "",                      0,        0,     0,
    "moose",                 5,        5,     5,
    "møøse",                 7,        5,     5,
    "C:\\Program Files",    16,       16,     16,
    ~@stringy,               8,        8,     8,
    "\x020ac \\x020ac",     11,        9,     9,
    "בדיקה",                10,        5,     5,
    "בדיקה 123",            14,        9,     9,
    "rántottcsirke",        14,        13,    13,
    "aáeéiíoóöőuúüű",       23,        14,    14,
    "AÁEÉIÍOÓÖŐUÚÜŰ",       23,        14,    14,
    "»«",                    4,         2,    2,
    ">><<",                  4,         4,    4,
);
#:map { my %hash; %hash<string bytes codes> = $_; \%hash };

# L<S32::Str/Str/=item chars>
# L<S32::Str/Str/=item codes>

for @data -> $string, $bytes, $codes, $chars {
    is($string.chars, $chars, "'{$string}'.chars");
    is($string.codes, $codes, "'{$string}'.codes");
}

# test something with a codepoint above 0xFFFF to catch errors that an
# UTF-16 based implementation might make

is "\x[E0100]".codes,  1, '.codes on a >0xFFFF char'; # \c[VARIATION SELECTOR-17]

# test graphemes without a precomposed character in Unicode 5
is "\c[LATIN CAPITAL LETTER A WITH DOT ABOVE, COMBINING DOT BELOW]".codes, 2, '.codes on grapheme without precomposite';

# vim: expandtab shiftwidth=4

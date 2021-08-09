use v6;
use Test;

plan 14;

{
    my int @is;
    ok @is ~~ array[int], 'my int @x gives a native int array';
}

{
    my @is of int;
    ok @is ~~ array[int], 'my @x of int gives a native int array';
}

{
    my int @is = 1..10;
    is @is.elems, 10, 'Can initialize an int array at declaration (1)';
    is @is[0], 1, 'Can initialize an int array at declaration (2)';
    is @is[9], 10, 'Can initialize an int array at declaration (3)';
}

{
    my num @ns;
    ok @ns ~~ array[num], 'my int @x gives a native num array';
}

{
    my @ns of num;
    ok @ns ~~ array[num], 'my @x of num gives a native num array';
}

{
    my num @ns = 1e0..10e0;
    is @ns.elems, 10, 'Can initialize a num array at declaration (1)';
    is @ns[0], 1e0, 'Can initialize a num array at declaration (2)';
    is @ns[9], 10e0, 'Can initialize a num array at declaration (3)';
}

{
    my str @strs = 'a', 'b', 'c';
    ok @strs ~~ array[str], 'my str @a gives array[str]';
    is @strs.elems, 3, 'array[str].elems';
    @strs.push('x');
    is @strs.elems, 4, 'array[str].push';
    is @strs.join('|'), 'a|b|c|x', 'array[str].join';
}

# vim: expandtab shiftwidth=4

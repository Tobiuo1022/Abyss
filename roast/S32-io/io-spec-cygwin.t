use v6;
use Test;
# L<S32::IO/IO::Spec>

plan 116;
my $cygwin = IO::Spec::Cygwin;

my @canonpath =
	'///../../..//./././a//b/.././c/././',   '/a/b/../c',
	'',                       '',
	'a/../../b/c',            'a/../../b/c',
	'/.',                     '/',
	'/./',                    '/',
	'/a/./',                  '/a',
	'/a/.',                   '/a',
	'/../../',                '/',
	'/../..',                 '/',
        'a:\\b\\c',               'a:/b/c',
	'c:a\\.\\b',              'c:a/b';
for @canonpath -> $in, $out {
	is $cygwin.canonpath($in), $out, "canonpath: '$in' -> '$out'";
}

my %canonpath-parent = (
	"foo/bar/.."         => "foo",
	"foo/bar/baz/../.."  => "foo",
	"/foo/.."            => "/",
	"foo/.."             => '.',
	"foo/../bar/../baz"  => "baz",
	"foo/../../bar"      => "../bar",
	"../../.."           => "../../..",
	"/../../.."          => "/",
	"/foo/../.."         => "/",
	"0"                  => "0",
    ''                   => '',
	"//../..usr/bin/../foo/.///ef"   => "//../..usr/foo/ef",
	'///../../..//./././a//b/.././c/././' => '/a/c',
);
for %canonpath-parent.kv -> $get, $want {
	is $cygwin.canonpath( $get , :parent ), $want,
		"canonpath(:parent): '$get' -> '$want'";
}

my @splitdir =
	'',           '',
	'/d1/d2/d3/', ',d1,d2,d3,',
	'd1/d2/d3/',  'd1,d2,d3,',
	'/d1/d2/d3',  ',d1,d2,d3',
	'd1/d2/d3',   'd1,d2,d3';

for @splitdir -> $in, $out {
	is $cygwin.splitdir(|$in).join(','), $out, "splitdir: '$in' -> '$out'"
}

is $cygwin.catdir(),                        '', "No argument returns empty string";
my @catdir =
	$( ),                    '',
	$('/'),                  '/',
	$('','d1','d2','d3',''), '/d1/d2/d3',
	$('d1','d2','d3',''),    'd1/d2/d3',
	$('','d1','d2','d3'),    '/d1/d2/d3',
	$('d1','d2','d3'),       'd1/d2/d3',
	$('/','d2/d3'),          '/d2/d3',
        $('/','/d1/d2'),         '/d1/d2',
        $('//notreally','/UNC'), '/notreally/UNC';
for @catdir -> $in, $out {
	is $cygwin.catdir(|$in), $out, "catdir: {$in.raku} -> '$out'";
}

my @split =
	'/',               ',/,/',
	'.',               ',.,.',
	'file',            ',.,file',
	'/dir',            ',/,dir',
	'/d1/d2/d3/',      ',/d1/d2,d3',
	'd1/d2/d3/',       ',d1/d2,d3',
	'/d1/d2/d3/.',     ',/d1/d2/d3,.',
	'/d1/d2/d3/..',    ',/d1/d2/d3,..',
	'/d1/d2/d3/.file', ',/d1/d2/d3,.file',
	'd1/d2/d3/file',   ',d1/d2/d3,file',
	'/../../d1/',      ',/../..,d1',
	'/././d1/',        ',/./.,d1',
	'c:/d1\\d2\\',    'c:,/d1,d2',
        '//unc/share',     '//unc/share,/,/';
for @split -> $in, $out {
	is $cygwin.split(|$in).hash.<volume dirname basename>.join(','),
            $out, "split: {$in.raku} -> '$out'"
}

my @join =
	$('','','file'),            'file',
	$('','/d1/d2/d3/',''),      '/d1/d2/d3/',
	$('','d1/d2/d3/',''),       'd1/d2/d3/',
	$('','/d1/d2/d3/.',''),     '/d1/d2/d3/.',
	$('','/d1/d2/d3/..',''),    '/d1/d2/d3/..',
	$('','/d1/d2/d3/','.file'), '/d1/d2/d3/.file',
	$('','d1/d2/d3/','file'),   'd1/d2/d3/file',
	$('','/../../d1/',''),      '/../../d1/',
	$('','/././d1/',''),        '/././d1/',
	$('d:','d2/d3/',''),        'd:d2/d3/',
	$('d:/','d2','d3/'),        'd:/d2/d3/';
for @join -> $in, $out {
	is $cygwin.join(|$in), $out, "join: {$in.raku} -> '$out'"
}


my @splitpath =
	'file',            ',,file',
	'/d1/d2/d3/',      ',/d1/d2/d3/,',
	'd1/d2/d3/',       ',d1/d2/d3/,',
	'/d1/d2/d3/.',     ',/d1/d2/d3/.,',
	'/d1/d2/d3/..',    ',/d1/d2/d3/..,',
	'/d1/d2/d3/.file', ',/d1/d2/d3/,.file',
	'd1/d2/d3/file',   ',d1/d2/d3/,file',
	'/../../d1/',      ',/../../d1/,',
	'/././d1/',        ',/././d1/,';
for @splitpath -> $in, $out {
	is $cygwin.splitpath(|$in).join(','), $out, "splitpath: {$in.raku} -> '$out'"
}

my @catpath =
	$('','','file'),            'file',
	$('','/d1/d2/d3/',''),      '/d1/d2/d3/',
	$('','d1/d2/d3/',''),       'd1/d2/d3/',
	$('','/d1/d2/d3/.',''),     '/d1/d2/d3/.',
	$('','/d1/d2/d3/..',''),    '/d1/d2/d3/..',
	$('','/d1/d2/d3/','.file'), '/d1/d2/d3/.file',
	$('','d1/d2/d3/','file'),   'd1/d2/d3/file',
	$('','/../../d1/',''),      '/../../d1/',
	$('','/././d1/',''),        '/././d1/',
	$('d:','d2/d3/',''),        'd:d2/d3/',
	$('d:/','d2','d3/'),        'd:/d2/d3/';
for @catpath -> $in, $out {
	is $cygwin.catpath(|$in), $out, "catpath: {$in.raku} -> '$out'"
}

my @catfile =
	$('a','b','c'),         'a/b/c',
	$('a','b','./c'),       'a/b/c',
	$('./a','b','c'),       'a/b/c',
	$('c'),                 'c',
	$('./c'),               'c';
for @catfile -> $in, $out {
	is $cygwin.catfile(|$in), $out, "catfile: {$in.raku} -> '$out'"
}


my @abs2rel =
	$('/t1/t2/t3','/t1/t2/t3'),          '.',
	$('/t1/t2/t4','/t1/t2/t3'),          '../t4',
	$('/t1/t2','/t1/t2/t3'),             '..',
	$('/t1/t2/t3/t4','/t1/t2/t3'),       't4',
	$('/t4/t5/t6','/t1/t2/t3'),          '../../../t4/t5/t6',
#	$('../t4','/t1/t2/t3'),              '../t4',
	$('/','/t1/t2/t3'),                  '../../..',
	$('///','/t1/t2/t3'),                '../../..',
	$('/.','/t1/t2/t3'),                 '../../..',
	$('/./','/t1/t2/t3'),                '../../..',
	$('/t1/t2/t3', '/'),                 't1/t2/t3',
	$('/t1/t2/t3', '/t1'),               't2/t3',
	$('t1/t2/t3', 't1'),                 't2/t3',
	$('t1/t2/t3', 't4'),                 '../t1/t2/t3';
for @abs2rel -> $in, $out {
	is $cygwin.abs2rel(|$in), $out, "abs2rel: {$in.raku} -> '$out'"
}

my @rel2abs =
	$('t4','/t1/t2/t3'),             '/t1/t2/t3/t4',
	$('t4/t5','/t1/t2/t3'),          '/t1/t2/t3/t4/t5',
	$('.','/t1/t2/t3'),              '/t1/t2/t3',
	$('..','/t1/t2/t3'),             '/t1/t2/t3/..',
	$('../t4','/t1/t2/t3'),          '/t1/t2/t3/../t4',
	$('/t1','/t1/t2/t3'),            '/t1',
	$('//t1/t2/t3','/foo'),          '//t1/t2/t3';
for @rel2abs -> $in, $out {
	is $cygwin.rel2abs(|$in), $out, "rel2abs: {$in.raku} -> '$out'"
}


is $cygwin.curdir,  '.',   'curdir is "."';
is $cygwin.devnull, '/dev/null', 'devnull is /dev/null';
is $cygwin.rootdir, '/',  'rootdir is "\\"';
is $cygwin.updir,   '..',  'updir is ".."';


if $*DISTRO.name !~~ any(<cygwin>) {
	skip 'cygwin on-platform tests', 2
}
else {
	# double check a couple of things to see if IO::Spec loaded correctly
	is IO::Spec.rootdir, '\\',  'IO::Spec loads Cygwin';
	ok {.IO.d && .IO.w}.(IO::Spec.tmpdir), "tmpdir: {IO::Spec.tmpdir} is a writable directory";
}

is-deeply IO::Spec::Cygwin.is-absolute("/\x[308]"), True,
    'combiners on "/" do not interfere with absolute path detection';

# vim: expandtab shiftwidth=4

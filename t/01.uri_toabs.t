use Test::More tests=>4;
use URI::ToABS;
my $uri = uri_to_abs('http://example.com/foo/../index.html');
is($uri, 'http://example.com/index.html', 'http://example.com/index.html');
$uri = uri_to_abs('http://example.com/foo/./index.html');
is($uri, 'http://example.com/foo/index.html', 'http://example.com/foo/index.html');

$uri = uri_to_abs('');
is($uri, '', 'empty string');
$uri = uri_to_abs('foo/bar');
is($uri, 'foo/bar', 'string not start with http');

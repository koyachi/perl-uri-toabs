use Test::More tests=>5;
use URI::ToABS;
my $uri = uri_to_abs('http://example.com/foo/../index.html');
is($uri, 'http://example.com/index.html', 'http://example.com/index.html');
$uri = uri_to_abs('http://example.com/foo/./index.html');
is($uri, 'http://example.com/foo/index.html', 'http://example.com/foo/index.html');

$uri = uri_to_abs('');
is($uri, '', 'empty string');
$uri = uri_to_abs('foo/bar');
is($uri, 'foo/bar', 'string not start with http');

# 2008-05-24 t.koyachi
# url end with slash
$uri = uri_to_abs('http://www.mythic-beasts.com/~mark/random/unicode-poster/');
is($uri, 'http://www.mythic-beasts.com/~mark/random/unicode-poster/', 'ok');

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'URI::ToABS',
    license             => 'perl',
    dist_author         => 'Tsutomu KOYACHI <rtk2106@gmail.com>',
    dist_version_from   => 'lib/URI/ToABS.pm',
    requires => {
        'Test::More' => 0,
        'version'    => 0,
    },
    add_to_cleanup      => [ 'URI-ToABS-*' ],
);

$builder->create_build_script();

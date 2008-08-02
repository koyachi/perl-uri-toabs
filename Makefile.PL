use strict;
use warnings;
use lib qw/lib/;
use Module::Build::Compat;
Module::Build::Compat->run_build_pl(argv => \@ARGV);
Module::Build::Compat->write_makefile(build_class => 'Module::Build');

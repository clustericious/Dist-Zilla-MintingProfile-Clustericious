use strict;
use warnings;
use Test::More tests => 1;
use Test::DZil;
use Path::Class qw( file dir );

my $tzil = Minter->_new_from_profile(
  [ Clustericious => 'app' ],
  { name => 'Foo' },
  { global_config_root => dir('corpus/global')->absolute },
);

$tzil->mint_dist;

like $tzil->slurp_file('mint/lib/Foo.pm'), qr{^package Foo;}, "package Foo";

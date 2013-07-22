use strict;
use warnings;
BEGIN { eval 'use EV' }
use Test::More;

plan skip_all => 'set AUTHOR_TESTING to enable this test (developer opnly)'
  unless $ENV{AUTHOR_TESTING};
eval "use Test::Pod::Coverage 1.00";
plan skip_all => "Test::Pod::Coverage 1.00 required for testing POD coverage" if $@;

all_pod_coverage_ok();

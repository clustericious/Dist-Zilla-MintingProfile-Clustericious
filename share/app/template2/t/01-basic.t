use strict;
use warnings;
use Test::Clustericious::Cluster;
use Test::More tests => 5;

my $cluster = Test::Clustericious::Cluster->new;
$cluster->create_cluster_ok('<%= $class %>');

my $url = $cluster->url;
my $t   = $cluster->t;   # isa Test::Mojo

$t->get_ok("$url/")
  ->status_is(200)
  ->content_type_like(qr[text/html])
  ->content_like(qr/welcome/i);

__DATA__

@@ etc/<%= $class %>.conf
---
url: <%= "\<\%= cluster->url \%\>" %>


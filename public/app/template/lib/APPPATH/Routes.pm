package <%= $class %>::Routes;

use strict;
use warnings;
use Clustericious::RouteBuilder;

# ABSTRACT: Set up routes for <%= $class %>.

=head1 DESCRIPTION

This package defines the REST API for <%= $class %>.

=head1 ROUTES

head2 get /

Get a welcome message.

=cut

get '/' => sub { shift->render_text("welcome to <%= $class %>") };

1;

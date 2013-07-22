package <%= $class %>;

# ABSTRACT: Application Class
# VERSION

=head1 SYNOPSIS

 use <%= $class %>

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use v5.10;
use Mojo::Base 'Clustericious::App';
use <%= $class %>::Routes;

1;

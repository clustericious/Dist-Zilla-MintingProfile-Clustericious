package <%= $class %>;

# ABSTRACT: Application class
# VERSION 

=head1 SYNOPSIS

 use <%= $class %>

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use base 'Clustericious::App';
use <%= $class %>::Routes;

1;

package <%= $class %>;

use strict;
use warnings;

# ABSTRACT: Application Class
# VERSION

=head1 SYNOPSIS

 use <%= $class %>

=head1 DESCRIPTIONo

=cut

use base 'Clustericious::App';
use <%= $class %>::Routes;

1;

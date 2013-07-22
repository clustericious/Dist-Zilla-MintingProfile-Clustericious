package <%= $class %>::DB;

use strict;
use warnings;
use v5.10;
use Clustericious::Config;
use base "Rose::Planter::DB";

# ABSTRACT: Manage the database connection
# VERSION

=head1 DESCRIPTION

This manages the database connection for <%= $class %>.

See L<Rose::Planter::DB>.

=cut

__PACKAGE__->register_databases(
    module_name  => "<%= $class %>",
    conf => Clustericious::Config->new("<%= $class %>")
);

1;


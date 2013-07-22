package <%= $class %>::Objects;

use strict;
use warnings;
use v5.10;
use <%= $class %>::DB;

# ABSTRACT: All model classes for <%= $class %>
# VERSION

=head1 DESCRIPTION

Use this package to load all the <%= $class %>::Object::* classes.

=cut

use Rose::Planter
        loader_params => {
            class_prefix => "<%= $class %>::Object",
            db_class     => "<%= $class %>::DB",
        },
        convention_manager_params => {};
1;

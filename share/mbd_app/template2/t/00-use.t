use strict;
use warnings;
BEGIN { eval 'use EV' }
use Test::More tests => 4;

use_ok('<%= $class %>');
use_ok('<%= $class %>::Routes');
use_ok('<%= $class %>::DB');
use_ok('<%= $class %>::Objects');

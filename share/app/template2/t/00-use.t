use strict;
use warnings;
BEGIN { eval 'use EV' }
use Test::More tests => 2;

use_ok('<%= $class %>');
use_ok('<%= $class %>::Routes');

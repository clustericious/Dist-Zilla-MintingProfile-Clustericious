use strict;
use warnings;
BEGIN { eval 'use EV' }
use Test::More tests => 1;

use_ok('<%= $class %>::Client');


use strict;
use Test::More tests => 1;

BEGIN { use_ok 'Jmp' }
BEGIN { use_ok 'Jmp::Router' }

BEGIN { use_ok 'Jmp::DB' }
BEGIN { use_ok 'Jmp::DB::Config' }
BEGIN { use_ok 'Jmp::DB::Session' }
BEGIN { use_ok 'Jmp::DB::URL' }

BEGIN { use_ok 'Jmp::Web' }
BEGIN { use_ok 'Jmp::Web::Shorten' }
BEGIN { use_ok 'Jmp::Web::Root' }
BEGIN { use_ok 'Jmp::Web::Redirect' }


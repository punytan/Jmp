use inc::Module::Install;
name 'Jmp';
all_from 'lib/Jmp.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;

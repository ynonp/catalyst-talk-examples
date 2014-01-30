use strict;
use warnings;
use v5.16;
use lib 'lib';
use DBIx::Class::Migration;

BEGIN { $ENV{CATALYST_DEBUG} = 0 }

use DBDemo;

my $schema = DBDemo->model('DB')->schema;
my $migration = DBIx::Class::Migration->new(
  schema => $schema,
);

$migration->prepare();
$migration->upgrade();
#$migration->install;

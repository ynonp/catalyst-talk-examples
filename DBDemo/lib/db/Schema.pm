use utf8;
package db::Schema;

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;

our $VERSION = 3;

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;


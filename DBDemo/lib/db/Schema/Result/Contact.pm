use utf8;
package db::Schema::Result::Contact;

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

__PACKAGE__->table("contacts");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "email",
  { data_type => "text", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("name_unique", ["name"]);




__PACKAGE__->meta->make_immutable;
1;



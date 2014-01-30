package DBDemo::Controller::Contacts;
use Moose;
use namespace::autoclean;
use JSON;

BEGIN { extends 'Catalyst::Controller' }

sub add :Local POST {
  my ( $self, $c ) = @_;
  my $data = $c->body_data;

  my $name = $data->{name};
  my $email = $data->{email};

  die "Missing name"  if ! defined($name);
  die "Missing email" if ! defined($email);

  $c->model('DB::Contact')->create({
      name  => $name,
      email => $email,
    });
  $c->res->body('ok');
}


sub info :Local GET Args(1) {
  my ( $self, $c, $name ) = @_;

  my $contact = $c->model('DB::Contact')->find({ name => $name });
  die 'Contact not found' if ! $contact;

  $c->res->body(to_json({
        name => $name,
        email => $contact->email,
      }));
}


1;

package RestApi::Controller::CodeBreaker;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use JSON;

BEGIN { extends 'Catalyst::Controller' }

sub encrypt :Local POST {
  my ( $self, $c ) = @_;
  my $data = $c->req->body_data;
  my $message = $data->{message};
  die 'Missing message' if ! defined($message);

  my $cipher = $c->model('CodeBreaker')->encrypt($message);

  $c->stash->{message} = $message;
  $c->stash->{cipher}  = $cipher;
}

sub decipher :Local POST {
  my ( $self, $c ) = @_;
  my $data = $c->req->body_data;
  my $messages = $data->{messages};
  my $target   = $data->{target};

  die "Missing messages" if ! defined($messages);
  die "Missing target"   if ! defined($target);

  $c->stash->{result} = $c->model('CodeBreaker')->decipher($target, $messages);
}


sub end {
  my ( $self, $c ) = @_;
  $c->forward($c->view('JSON'));
}




1;

package RestApi::Model::CodeBreaker;
use Moose;
use namespace::autoclean;
use Crypt::RC4;

use CodeBreaker::EncryptedMsg;

extends 'Catalyst::Model';

my $password = 'zombie';

sub encrypt {
  my ( $self, $message ) = @_;
  unpack('H*', RC4($password, $message));
}

sub decrypt {
  my ( $self, $cipher ) = @_;
  my $cipher_bytes = pack('H*', $cipher);
  RC4($password, $cipher_bytes);
}

sub decipher {
  my ( $self, $target, $messages ) = @_;

  $target = pack("H*", $target);
  $_      = pack("H*", $_) for @{$messages};

  my $msg = CodeBreaker::EncryptedMsg->new(text => $target);
  $msg->is_the_same_key_as($_) for @{$messages};

  $msg->as_string;
}


__PACKAGE__->meta->make_immutable;

1;

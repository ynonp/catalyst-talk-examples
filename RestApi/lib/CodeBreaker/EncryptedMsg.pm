use v5.16;
use CodeBreaker::Letter;

package CodeBreaker::EncryptedMsg {
  use Moose;
  use Term::ANSIColor;

  has 'letters', is => "ro", isa => 'ArrayRef', lazy_build => 1;
  has 'text', is => 'ro', isa => 'Str', required => 1;

  sub _build_letters { [ map { CodeBreaker::Letter->new } split(//,shift->text) ] }

  sub is_the_same_key_as {
    my ( $self, $other ) = @_;

    for my $idx (0..length($self->text)-1) {
      next if $idx > length($self->text);
      next if $idx > length($other);

      my $target = ord(substr($self->text, $idx, 1)) ^ ord(substr($other,$idx,1));
      $self->letters->[$idx]->can_xor_to($target);
    }
  }

  sub as_string {
    my ( $self ) = @_;
    join('', map { @{$_->val} == 1 ? $_->val->[0] : '?' } @{$self->letters});
  }


  sub print {
    my ( $self ) = @_;
    foreach my $letter (@{$self->letters}) {
      my $possibilities = scalar @{$letter->val};

      if ( $possibilities == 1 ) {
        print color 'green';
        print @{$letter->val};
      }
      elsif ( ( $possibilities > 1 ) && ( $possibilities < 5 ) ) {
        print color 'red';
        print "?";
      }
      else {
        print color 'yellow';
        print "?";
      }
      print color 'reset';
    }
    print "\n";
  }

}

1;

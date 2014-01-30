use v5.16;
my @ab = ('a'..'z',' ');

package CodeBreaker::Letter {
  use Moose;
  use List::MoreUtils qw/pairwise any/;
  has 'val', is => 'rw', isa => 'ArrayRef[Str]', default => sub { [@ab] };


  sub can_xor_to {
    my ( $self, $target ) = @_;
    my @result;
    foreach my $val (@{$self->val}) {
      push @result, $val if any { (ord($val) ^ ord($_)) == $target } @ab;
    }

    $self->val(\@result);
  }

}

1;

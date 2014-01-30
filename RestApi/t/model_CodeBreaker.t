use strict;
use warnings;
use Test::More;


BEGIN { use_ok 'RestApi::Model::CodeBreaker' }

my $m = RestApi::Model::CodeBreaker->new;

my @text = (
  'just another',
  'test',
  '1020304050',
);

foreach my $msg (@text) {
  is($m->decrypt($m->encrypt($msg)), $msg, "D(E($msg)) == $msg");
}


done_testing();

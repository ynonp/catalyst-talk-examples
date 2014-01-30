use v5.16;
use Crypt::RC4;
use CodeBreaker::EncryptedMsg;
use Test::More;

my @text = (
  'johnnie get your gun get your gun get your gun',
  'take it on the run on the run on the run',
  'hear them calling you and me',
  'every son of liberty',
  'hurry right away, no delay, go today',
  'make your daddy glad to have had such a lad',
  'tell your sweetheart not to pine',
  'to be proud her boys in line',
  'over there, over there',
  'send the word, send the word over there',
  'that the yanks are coming, the yanks are coming',
  'the drums are rum-tumming everywhere',
);

my @cipher = map { RC4('zombie', $_) } @text;


my $msg = CodeBreaker::EncryptedMsg->new(text => $cipher[3]);
$msg->is_the_same_key_as($_) for @cipher;

my $result = $msg->as_string;

my $unresolved_count = $result =~ tr/?/?/;
ok($unresolved_count * 2 < length($result), "Found at least 1/2 characters");

$msg->print;

done_testing;


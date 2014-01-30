use strict;
use warnings;

use DBDemo;

my $app = DBDemo->apply_default_middlewares(DBDemo->psgi_app);
$app;


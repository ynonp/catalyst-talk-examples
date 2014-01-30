use strict;
use warnings;

use RestApi;

my $app = RestApi->apply_default_middlewares(RestApi->psgi_app);
$app;


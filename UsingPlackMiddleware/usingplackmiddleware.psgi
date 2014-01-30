use strict;
use warnings;

use UsingPlackMiddleware;

my $app = UsingPlackMiddleware->apply_default_middlewares(UsingPlackMiddleware->psgi_app);
$app;


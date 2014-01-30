#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';

BEGIN { $ENV{CATALYST_DEBUG} = 0 }

use DBDemo;
use DateTime;

my $password = shift || 'admin';

my $admin = DBDemo->model('DB::User')->find_or_create({
  username => 'admin',
  active => 'Y',
  name => 'Administrator',
  email_address => 'admin@home.com',
  password => '',
});

$admin->update({ password => $password, password_expires => DateTime->now });


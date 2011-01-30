#!/usr/bin/env perl

# Tell Perl where our lib is (ALWAYS use this)
use lib "$ENV{HOME}/perl5/lib/perl5";

# local::lib sets everything up correctly from  (ALWAYS use this)
use local::lib;

# ensure we declare everything correctly (ALWAYS use this)
use strict;

# Give us diagnostic warnings where possible (ALWAYS use this)
use warnings;

# Code to run our application
use Plack::Runner;

# Code to validate that our application is configured correctly
use Plack::Middleware::Lint;

# A basic app
my $app = sub {
    my $env = shift;
    return [
        200,    # HTTP Status code
        [ 'Content-Type' => 'text/html' ],    # HTTP Headers,
        ["All is good"]                       # Content
    ];
};

# Create a runner object
my $runner = Plack::Runner->new;

# Pass in command line arguments (useful when developing)
$runner->parse_options(@ARGV);

# Actually run the application
$runner->run($app);

#!/usr/bin/env perl

use lib "$ENV{HOME}/perl5/lib/perl5";
use local::lib;

use strict;
use warnings;
use Plack::Runner;

# Use Plack::Builder to 'mount' applications on specific URLs
use Plack::Builder;

# Get directory listings and serve files
use Plack::App::Directory;

my $default_app = sub {
    my $env = shift;
    return [ 200, [ 'Content-Type' => 'text/html' ], ["All is good"] ];
};

my $dir_app = Plack::App::Directory->new( { root => "/tmp/" } )->to_app;

my $builder = Plack::Builder->new();

$builder->mount('/'    => $default_app);
$builder->mount('/tmp' => $dir_app);

my $app = $builder->to_app();

my $runner = Plack::Runner->new;
$runner->parse_options(@ARGV);
$runner->run($app);

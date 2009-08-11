#!/usr/bin/perl -w
use strict;

use Test::More tests => 6;
use Text::Demoroniser   qw(demoroniser demoroniser_utf8);

my %examples = (
    '–“”'       => [ '-""', 'â€“â€œâ€' ],
    'abc'       => [ 'abc', 'abc' ],
    ''          => [ '', '' ],
);

for my $ex (keys %examples) {
    is(demoroniser($ex),      $examples{$ex}->[0],"demoroniser returns valid ASCII string for '$ex'");
    is(demoroniser_utf8($ex), $examples{$ex}->[1],"demoroniser_utf8 returns valid UTF8 string for '$ex'");
}
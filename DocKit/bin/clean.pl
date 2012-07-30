#!/usr/bin/env perl
use File::Glob;

my @list = <couchdb-{manual,release}-*/couchdb-{manual,release-*}.{html*,pdf,epub*}>;
mkdir "dist";

foreach my $doc (@list)
{
    my $dist = $doc;
    $dist =~ s!.+/!dist/!;
    print "moving $doc  ->\n\t$dist\n\t...";
    print ((rename $doc, $dist) ? "OK\n" : "FAILED\n");
}

exit 0;

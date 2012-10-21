package Acme::Anime::TV::Data;
use strict;
use warnings;
use Any::Moose;

has id => (
    is       => 'ro',
    isa      => 'Int',
    required => 1,
);

has title => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has number => (
    is       => 'ro',
    isa      => 'Int',
);

no Any::Moose;
__PACKAGE__->meta->make_immutable;

1;

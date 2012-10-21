package Acme::Anime::TV;
use strict;
use warnings;
use Acme::Anime::TV::Const;
use Data::Dumper;

use Any::Moose;

has list => (
    is      => 'ro',
    isa     => 'ArrayRef',
    default => sub { \@Acme::Anime::TV::Const::LIST },
);

sub find {
    my ($self, @args) = @_;
    return $self->list;
}

no Any::Moose;
__PACKAGE__->meta->make_immutable;

1;

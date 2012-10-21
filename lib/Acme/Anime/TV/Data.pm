package Acme::Anime::TV::Data;
use strict;
use warnings;
use Any::Moose;
use Encode;
use Data::Dumper;

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

sub is_found {
    my ($self, $query) = @_;
    for my $field (keys %$query) {
        if (ref $query->{$field} eq 'Regexp' ) {
            return 0 if ($self->$field !~ $query->{$field});
        } else {
            return 0 if ($self->$field ne $query->{$field});
        }
    }
    return 1;
}

sub print {
    my ($self) = @_;

    print Dumper {
        id => $self->id,
        title => encode_utf8 $self->title,
    };
}


no Any::Moose;
__PACKAGE__->meta->make_immutable;

1;

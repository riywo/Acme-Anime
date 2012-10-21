package Acme::Anime::TV;
use strict;
use warnings;
use Acme::Anime::TV::Data;
use Acme::Anime::TV::Const;
use Data::Dumper;

use Any::Moose;

has data_list => (
    is      => 'ro',
    isa     => 'ArrayRef',
    default => sub {
        my @ret;
        for my $data (@Acme::Anime::TV::Const::LIST) {
            push @ret, Acme::Anime::TV::Data->new($data);
        }
        return \@ret;
    },
);

sub find {
    my ($self, @args) = @_;
    my @ret;
    for my $data (@{$self->data_list}) {
        push @ret, $data if($data->is_found(@args));
    }
    return @ret;
}

no Any::Moose;
__PACKAGE__->meta->make_immutable;

1;

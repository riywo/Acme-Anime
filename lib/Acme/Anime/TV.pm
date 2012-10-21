package Acme::Anime::TV;
use strict;
use warnings;
use Acme::Anime::TV::Data;
use Acme::Anime::TV::Const;

use Any::Moose;

has data_list => (
    is      => 'ro',
    isa     => 'ArrayRef',
    default => sub {
        my @ret;
        for my $data (@Acme::Anime::TV::Const::LIST) {
            my $args = +{};
            for (qw/id title number/) {
                $args->{$_} = $data->{$_} if exists $data->{$_};
            }
            push @ret, Acme::Anime::TV::Data->new($args);
        }
        return \@ret;
    },
);

sub find {
    my ($self, $query) = @_;
    my @ret;
    for my $data (@{$self->data_list}) {
        push @ret, $data if($data->is_found($query));
    }
    return @ret;
}

no Any::Moose;
__PACKAGE__->meta->make_immutable;

1;

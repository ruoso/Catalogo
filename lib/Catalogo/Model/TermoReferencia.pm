package Catalogo::Model::TermoReferencia;
use Moose;
extends 'Catalyst::Model';
with 'Catalyst::Component::InstancePerContext';
use aliased 'Catalogo::Negocio::TermoReferencia';

sub build_per_context_instance{
    my ($self, $c) = @_;
    return TermoReferencia->new({ schema => $c->model('DB'),
                                  user   => $c->user });
}

1;

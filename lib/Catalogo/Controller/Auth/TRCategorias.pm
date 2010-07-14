package Catalogo::Controller::Auth::TRCategorias;
use Moose;
use namespace::autoclean;
use utf8;
use MooseX::Method::Signatures; 
BEGIN { extends 'Catalyst::Controller' }

sub base :Chained('/auth/base') :CaptureArgs(0) :PathPart('trcategorias') {

}

sub index :Chained('base') :Args(0) :PathPart('') {

}

sub flat_vazio :Chained('base') :Args(0) :PathPart('flat') {
    my ($self, $c) = @_;
    $c->res->redirect($c->uri_for_action('/auth/trcategorias/flat', 0));
}

sub flat :Chained('base') :Args(1) {
    my ($self, $c, $id) = @_;
    $id = undef unless $id;
    $c->stash->{tr_categoria_mae_id} = $id;
    if ($id) {
        $c->stash->{tr_categoria_mae} =
          $c->model('TermoReferencia')->obter_tr_categoria($id);
    }
}

__PACKAGE__->meta->make_immutable;

1;

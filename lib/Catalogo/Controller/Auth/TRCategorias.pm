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

__PACKAGE__->meta->make_immutable;

1;

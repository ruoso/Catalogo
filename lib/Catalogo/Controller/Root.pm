package Catalogo::Controller::Root;
use Moose;
use namespace::autoclean;
use utf8; 
BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub base :Chained('/') :CaptureArgs(0) :PathPart('') {}

sub index :Chained('base') :Args(0) :PathPart('') {}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;

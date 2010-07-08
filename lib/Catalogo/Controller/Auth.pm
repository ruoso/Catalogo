package Catalogo::Controller::Auth;
use Moose;
use namespace::autoclean;
use utf8;
use MooseX::Method::Signatures; 
BEGIN { extends 'Catalyst::Controller' }

sub base :Chained('/base') :CaptureArgs(0) :PathPart('auth') {
    my ($self, $c) = @_;
    unless ($c->user) {
        $c->res->redirect($c->uri_for_action('/auth/login'));
    }
}

sub index :Chained('base') :Args(0) :PathPart('') {}

sub login :Chained('/base') :Args(0) {
    my ($self, $c) = @_;
    if ($c->req->param('login') &&
        $c->authenticate({ username => $c->req->param('login'),
                           password => $c->req->param('password') })) {
        $c->res->redirect($c->uri_for_action('/auth/index'));
    } elsif ($c->req->param('login')) {
        $c->stash->{error} = 'usuario-invalido';
    }
}

sub logout :Chained('/base') :Args(0) {
    my ($self, $c) = @_;
    $c->logout;
    $c->res->redirect($c->uri_for_action('/index'));
}

__PACKAGE__->meta->make_immutable;

1;

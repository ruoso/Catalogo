package Catalogo::Negocio::TermoReferencia;
use Moose;
use MooseX::Method::Signatures;
use aliased 'MooseX::Meta::Method::Transactional';
use aliased 'MooseX::Meta::Method::Authorized';

has schema => (is => 'ro', required => 1);
has user   => (is => 'ro', required => 1);


1;

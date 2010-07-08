package Catalogo::Negocio::TermoReferencia;
use Moose;
use MooseX::Method::Signatures;
use aliased 'MooseX::Meta::Method::Transactional';
use aliased 'MooseX::Meta::Method::Authorized';

has schema => (is => 'ro', required => 1);
has user   => (is => 'ro', required => 1);

method listar_tr_categorias
  ( Int $categoria_inicial, Int $profundidade = 2,
    Int $linhas_por_pagina = 50, Int $pagina = 1,
    Str $pesquisa )
  does Transactional
  does Authorized(requires => ['adm_catalogo_tr']) {

=for nobody

      WITH RECURSIVE arvore_categorias (nivel, tr_categoria_id, codigo, nome, descricao) AS (
           SELECT 0, tr_categoria_id, codigo, nome, descricao FROM tr_categorias WHERE tr_categoria_mae_id IS NULL
          UNION ALL
           SELECT ac.nivel + 1, trin.tr_categoria_id, trin.codigo, trin.nome, trin.descricao
           FROM arvore_categorias ac, tr_categorias trin WHERE trin.tr_categoria_mae_id=ac.tr_categoria_id
      )
      SELECT * FROM arvore_categorias;

=cut

  };


1;

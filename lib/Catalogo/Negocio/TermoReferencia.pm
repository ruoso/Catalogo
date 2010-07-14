package Catalogo::Negocio::TermoReferencia;
use Moose;
use MooseX::Method::Signatures;
use aliased 'MooseX::Meta::Method::Transactional';
use aliased 'MooseX::Meta::Method::Authorized';

has schema => (is => 'ro', required => 1);
has user   => (is => 'ro', required => 1);

method listar_tr_categorias( Str $pesquisa? = '%' ) does Transactional does Authorized(requires => ['adm_catalogo_tr']) {
    $self->schema->resultset('TrCategoria')->search_rs
      ({ -or => { nome => { ilike => $pesquisa },
                  descricao => { ilike => $pesquisa } } },
       { order_by => 'codigo' });

};

method navegar_tr_categorias(Int $tr_categoria_id?) does Transactional does Authorized(requires => ['adm_catalogo_tr']) {
    $self->schema->resultset('TrCategoria')->search_rs
      ({ tr_categoria_mae_id => $tr_categoria_id },
       { order_by => 'codigo' });
};

method obter_tr_categoria(Int $tr_categoria_id) does Transactional does Authorized(requires => ['adm_catalogo_tr']) {
    $self->schema->resultset('TrCategoria')->find
      ({ tr_categoria_id => $tr_categoria_id });
};

1;


=for nobody

      WITH RECURSIVE arvore_categorias (nivel, tr_categoria_id, codigo, nome, descricao) AS (
           SELECT 0, tr_categoria_id, codigo, nome, descricao FROM tr_categorias WHERE tr_categoria_mae_id IS NULL
          UNION ALL
           SELECT ac.nivel + 1, trin.tr_categoria_id, trin.codigo, trin.nome, trin.descricao
           FROM arvore_categorias ac, tr_categorias trin WHERE trin.tr_categoria_mae_id=ac.tr_categoria_id
      )
      SELECT * FROM arvore_categorias;

=cut

package Catalogo::DBSchema::Result::PrCategoria;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::PrCategoria

=cut

__PACKAGE__->table("pr_categorias");

=head1 ACCESSORS

=head2 pr_categoria_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'pr_categorias_pr_categoria_id_seq'

=head2 codigo

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 nome

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 descricao

  data_type: 'varchar'
  is_nullable: 1
  size: 2000

=head2 tipo_classificacao_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pr_categoira_mae_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 validade_inicio

  data_type: 'timestamp'
  is_nullable: 1

=head2 validade_fim

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "pr_categoria_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "pr_categorias_pr_categoria_id_seq",
  },
  "codigo",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "nome",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "descricao",
  { data_type => "varchar", is_nullable => 1, size => 2000 },
  "tipo_classificacao_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pr_categoira_mae_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "validade_inicio",
  { data_type => "timestamp", is_nullable => 1 },
  "validade_fim",
  { data_type => "timestamp", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("pr_categoria_id");

=head1 RELATIONS

=head2 tipo_classificacao

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::TipoClassificacao>

=cut

__PACKAGE__->belongs_to(
  "tipo_classificacao",
  "Catalogo::DBSchema::Result::TipoClassificacao",
  { tipo_classificacao_id => "tipo_classificacao_id" },
  { on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 pr_categoira_mae

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::PrCategoria>

=cut

__PACKAGE__->belongs_to(
  "pr_categoira_mae",
  "Catalogo::DBSchema::Result::PrCategoria",
  { pr_categoria_id => "pr_categoira_mae_id" },
  { join_type => "LEFT", on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 pr_categorias

Type: has_many

Related object: L<Catalogo::DBSchema::Result::PrCategoria>

=cut

__PACKAGE__->has_many(
  "pr_categorias",
  "Catalogo::DBSchema::Result::PrCategoria",
  { "foreign.pr_categoira_mae_id" => "self.pr_categoria_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 produtos

Type: has_many

Related object: L<Catalogo::DBSchema::Result::Produto>

=cut

__PACKAGE__->has_many(
  "produtos",
  "Catalogo::DBSchema::Result::Produto",
  { "foreign.pr_categoria_id" => "self.pr_categoria_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-14 16:14:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:34WO0UK9nugMFOb7PrJQew


# You can replace this text with custom content, and it will be preserved on regeneration
1;

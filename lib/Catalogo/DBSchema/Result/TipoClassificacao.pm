package Catalogo::DBSchema::Result::TipoClassificacao;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::TipoClassificacao

=cut

__PACKAGE__->table("tipos_classificacao");

=head1 ACCESSORS

=head2 tipo_classificacao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tipos_classificacao_tipo_classificacao_id_seq'

=head2 nome

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 descricao

  data_type: 'varchar'
  is_nullable: 1
  size: 2000

=cut

__PACKAGE__->add_columns(
  "tipo_classificacao_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "tipos_classificacao_tipo_classificacao_id_seq",
  },
  "nome",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "descricao",
  { data_type => "varchar", is_nullable => 1, size => 2000 },
);
__PACKAGE__->set_primary_key("tipo_classificacao_id");

=head1 RELATIONS

=head2 pr_categorias

Type: has_many

Related object: L<Catalogo::DBSchema::Result::PrCategoria>

=cut

__PACKAGE__->has_many(
  "pr_categorias",
  "Catalogo::DBSchema::Result::PrCategoria",
  { "foreign.tipo_classificacao_id" => "self.tipo_classificacao_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-14 16:14:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:r/x1Wy6eo49iar/w9oWmJA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

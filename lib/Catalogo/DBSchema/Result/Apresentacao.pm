package Catalogo::DBSchema::Result::Apresentacao;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::Apresentacao

=cut

__PACKAGE__->table("apresentacoes");

=head1 ACCESSORS

=head2 apresentacao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'apresentacoes_apresentacao_id_seq'

=head2 produto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 unidade_medida

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 cod_barra

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "apresentacao_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "apresentacoes_apresentacao_id_seq",
  },
  "produto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "unidade_medida",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "cod_barra",
  { data_type => "varchar", is_nullable => 1, size => 50 },
);
__PACKAGE__->set_primary_key("apresentacao_id");

=head1 RELATIONS

=head2 produto

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::Produto>

=cut

__PACKAGE__->belongs_to(
  "produto",
  "Catalogo::DBSchema::Result::Produto",
  { produto_id => "produto_id" },
  { on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 derivacoes

Type: has_many

Related object: L<Catalogo::DBSchema::Result::Composicao>

=cut

__PACKAGE__->has_many(
  "derivacoes",
  "Catalogo::DBSchema::Result::Composicao",
  { "foreign.apresentacao_origem_id" => "self.apresentacao_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 composicoes

Type: has_many

Related object: L<Catalogo::DBSchema::Result::Composicao>

=cut

__PACKAGE__->has_many(
  "composicoes",
  "Catalogo::DBSchema::Result::Composicao",
  { "foreign.apresentacao_composta_id" => "self.apresentacao_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-14 16:14:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:I8g6bvXuHY7IsR/byUdwMA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

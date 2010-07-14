package Catalogo::DBSchema::Result::TrCategoria;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::TrCategoria

=cut

__PACKAGE__->table("tr_categorias");

=head1 ACCESSORS

=head2 tr_categoria_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tr_categorias_tr_categoria_id_seq'

=head2 codigo

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 nome

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 descricao

  data_type: 'varchar'
  is_nullable: 1
  size: 2000

=head2 tr_categoria_mae_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 validade_inicio

  data_type: 'timestamp'
  is_nullable: 1

=head2 validade_fim

  data_type: 'timestamp'
  is_nullable: 1

=head2 nivel

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 terminal

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tr_categoria_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "tr_categorias_tr_categoria_id_seq",
  },
  "codigo",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "nome",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "descricao",
  { data_type => "varchar", is_nullable => 1, size => 2000 },
  "tr_categoria_mae_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "validade_inicio",
  { data_type => "timestamp", is_nullable => 1 },
  "validade_fim",
  { data_type => "timestamp", is_nullable => 1 },
  "nivel",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "terminal",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("tr_categoria_id");

=head1 RELATIONS

=head2 termos_referencia

Type: has_many

Related object: L<Catalogo::DBSchema::Result::TermoReferencia>

=cut

__PACKAGE__->has_many(
  "termos_referencia",
  "Catalogo::DBSchema::Result::TermoReferencia",
  { "foreign.tr_categoria_id" => "self.tr_categoria_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tr_categoria_mae

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::TrCategoria>

=cut

__PACKAGE__->belongs_to(
  "tr_categoria_mae",
  "Catalogo::DBSchema::Result::TrCategoria",
  { tr_categoria_id => "tr_categoria_mae_id" },
  { join_type => "LEFT", on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 tr_categorias

Type: has_many

Related object: L<Catalogo::DBSchema::Result::TrCategoria>

=cut

__PACKAGE__->has_many(
  "tr_categorias",
  "Catalogo::DBSchema::Result::TrCategoria",
  { "foreign.tr_categoria_mae_id" => "self.tr_categoria_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-14 16:14:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:q3V6vpUH2dzEPc32DSvI0A

# You can replace this text with custom content, and it will be preserved on regeneration
1;

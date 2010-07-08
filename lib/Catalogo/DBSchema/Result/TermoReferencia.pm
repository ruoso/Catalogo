package Catalogo::DBSchema::Result::TermoReferencia;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::TermoReferencia

=cut

__PACKAGE__->table("termos_referencia");

=head1 ACCESSORS

=head2 termo_referencia_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'termos_referencia_termo_referencia_id_seq'

=head2 tr_categoria_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 codigo

  data_type: 'character varying'
  is_nullable: 0
  size: 20

=head2 nome

  data_type: 'character varying'
  is_nullable: 0
  size: 200

=head2 descricao

  data_type: 'character varying'
  is_nullable: 1
  size: 2000

=head2 natureza_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 validade_inicio

  data_type: 'timestamp without time zone'
  is_nullable: 1

=head2 validade_fim

  data_type: 'timestamp without time zone'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "termo_referencia_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "termos_referencia_termo_referencia_id_seq",
  },
  "tr_categoria_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "codigo",
  { data_type => "character varying", is_nullable => 0, size => 20 },
  "nome",
  { data_type => "character varying", is_nullable => 0, size => 200 },
  "descricao",
  { data_type => "character varying", is_nullable => 1, size => 2000 },
  "natureza_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "validade_inicio",
  { data_type => "timestamp without time zone", is_nullable => 1 },
  "validade_fim",
  { data_type => "timestamp without time zone", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("termo_referencia_id");

=head1 RELATIONS

=head2 aderencias

Type: has_many

Related object: L<Catalogo::DBSchema::Result::Aderencia>

=cut

__PACKAGE__->has_many(
  "aderencias",
  "Catalogo::DBSchema::Result::Aderencia",
  { "foreign.termo_referencia_id" => "self.termo_referencia_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 requisitos

Type: has_many

Related object: L<Catalogo::DBSchema::Result::Requisito>

=cut

__PACKAGE__->has_many(
  "requisitos",
  "Catalogo::DBSchema::Result::Requisito",
  { "foreign.termo_referencia_id" => "self.termo_referencia_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 natureza

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::Natureza>

=cut

__PACKAGE__->belongs_to(
  "natureza",
  "Catalogo::DBSchema::Result::Natureza",
  { natureza_id => "natureza_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 tr_categoria

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::TrCategoria>

=cut

__PACKAGE__->belongs_to(
  "tr_categoria",
  "Catalogo::DBSchema::Result::TrCategoria",
  { tr_categoria_id => "tr_categoria_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-07-07 23:44:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zmIUm9tuWerMwalPHia/Yg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

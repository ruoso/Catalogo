package Catalogo::DBSchema::Result::Requisito;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::Requisito

=cut

__PACKAGE__->table("requisitos");

=head1 ACCESSORS

=head2 requisito_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'requisitos_requisito_id_seq'

=head2 termo_referencia_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 descricao

  data_type: 'character varying'
  is_nullable: 0
  size: 2000

=head2 validade_inicio

  data_type: 'timestamp without time zone'
  is_nullable: 1

=head2 validade_fim

  data_type: 'timestamp without time zone'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "requisito_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "requisitos_requisito_id_seq",
  },
  "termo_referencia_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 0, size => 2000 },
  "validade_inicio",
  { data_type => "timestamp without time zone", is_nullable => 1 },
  "validade_fim",
  { data_type => "timestamp without time zone", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("requisito_id");

=head1 RELATIONS

=head2 termo_referencia

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::TermoReferencia>

=cut

__PACKAGE__->belongs_to(
  "termo_referencia",
  "Catalogo::DBSchema::Result::TermoReferencia",
  { termo_referencia_id => "termo_referencia_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-07-07 23:44:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HMG27eI5cc07u+x+tz/QUw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

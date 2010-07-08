package Catalogo::DBSchema::Result::Natureza;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::Natureza

=cut

__PACKAGE__->table("naturezas");

=head1 ACCESSORS

=head2 natureza_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'naturezas_natureza_id_seq'

=head2 descricao

  data_type: 'character'
  is_nullable: 1
  size: 10

=cut

__PACKAGE__->add_columns(
  "natureza_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "naturezas_natureza_id_seq",
  },
  "descricao",
  { data_type => "character", is_nullable => 1, size => 10 },
);
__PACKAGE__->set_primary_key("natureza_id");

=head1 RELATIONS

=head2 termos_referencia

Type: has_many

Related object: L<Catalogo::DBSchema::Result::TermoReferencia>

=cut

__PACKAGE__->has_many(
  "termos_referencia",
  "Catalogo::DBSchema::Result::TermoReferencia",
  { "foreign.natureza_id" => "self.natureza_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-07-07 23:48:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2jaiERbEuWXx9BbIUB1peA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

package Catalogo::DBSchema::Result::Aderencia;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::Aderencia

=cut

__PACKAGE__->table("aderencias");

=head1 ACCESSORS

=head2 produto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 termo_referencia_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 validade_inicio

  data_type: 'timestamp'
  is_nullable: 1

=head2 validade_fim

  data_type: 'timestamp'
  default_value: infinity
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "produto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "termo_referencia_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "validade_inicio",
  { data_type => "timestamp", is_nullable => 1 },
  "validade_fim",
  { data_type => "timestamp", default_value => "infinity", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("produto_id", "termo_referencia_id", "validade_fim");

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

=head2 termo_referencia

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::TermoReferencia>

=cut

__PACKAGE__->belongs_to(
  "termo_referencia",
  "Catalogo::DBSchema::Result::TermoReferencia",
  { termo_referencia_id => "termo_referencia_id" },
  { on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-14 16:14:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oH+uVG1saWlLhEUU2AIrJQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

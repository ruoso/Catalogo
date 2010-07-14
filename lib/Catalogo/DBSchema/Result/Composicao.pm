package Catalogo::DBSchema::Result::Composicao;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::Composicao

=cut

__PACKAGE__->table("composicoes");

=head1 ACCESSORS

=head2 composicao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'composicoes_composicao_id_seq'

=head2 apresentacao_origem_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 quantidade

  data_type: 'double precision'
  is_nullable: 0

=head2 apresentacao_composta_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "composicao_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "composicoes_composicao_id_seq",
  },
  "apresentacao_origem_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "quantidade",
  { data_type => "double precision", is_nullable => 0 },
  "apresentacao_composta_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("composicao_id");

=head1 RELATIONS

=head2 apresentacao_origem

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::Apresentacao>

=cut

__PACKAGE__->belongs_to(
  "apresentacao_origem",
  "Catalogo::DBSchema::Result::Apresentacao",
  { apresentacao_id => "apresentacao_origem_id" },
  { on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 apresentacao_composta

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::Apresentacao>

=cut

__PACKAGE__->belongs_to(
  "apresentacao_composta",
  "Catalogo::DBSchema::Result::Apresentacao",
  { apresentacao_id => "apresentacao_composta_id" },
  { on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-14 16:14:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J41xP46sEbVhpIYxEMj+iQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

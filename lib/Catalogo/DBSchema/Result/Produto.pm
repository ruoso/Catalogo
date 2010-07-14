package Catalogo::DBSchema::Result::Produto;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Catalogo::DBSchema::Result::Produto

=cut

__PACKAGE__->table("produtos");

=head1 ACCESSORS

=head2 produto_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'produtos_produto_id_seq'

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

=head2 pr_categoria_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 validade_inicio

  data_type: 'timestamp'
  is_nullable: 1

=head2 validade_fim

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "produto_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "produtos_produto_id_seq",
  },
  "codigo",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "nome",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "descricao",
  { data_type => "varchar", is_nullable => 1, size => 2000 },
  "pr_categoria_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "validade_inicio",
  { data_type => "timestamp", is_nullable => 1 },
  "validade_fim",
  { data_type => "timestamp", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("produto_id");

=head1 RELATIONS

=head2 aderencias

Type: has_many

Related object: L<Catalogo::DBSchema::Result::Aderencia>

=cut

__PACKAGE__->has_many(
  "aderencias",
  "Catalogo::DBSchema::Result::Aderencia",
  { "foreign.produto_id" => "self.produto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 apresentacoes

Type: has_many

Related object: L<Catalogo::DBSchema::Result::Apresentacao>

=cut

__PACKAGE__->has_many(
  "apresentacoes",
  "Catalogo::DBSchema::Result::Apresentacao",
  { "foreign.produto_id" => "self.produto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 pr_categoria

Type: belongs_to

Related object: L<Catalogo::DBSchema::Result::PrCategoria>

=cut

__PACKAGE__->belongs_to(
  "pr_categoria",
  "Catalogo::DBSchema::Result::PrCategoria",
  { pr_categoria_id => "pr_categoria_id" },
  { on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-14 16:14:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BpGhCw5H9mSRcV3YIRur6A


# You can replace this text with custom content, and it will be preserved on regeneration
1;

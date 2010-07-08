package Catalogo::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Catalogo::DBSchema',
    connect_info => 'dbi:Pg:dbname=catalogo;host=127.0.0.1'
);

1;

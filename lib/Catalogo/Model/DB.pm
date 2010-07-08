package Catalogo::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Catalogo::DBSchema',
    connect_info => ['dbi:Pg:dbname=pmf;host=127.0.0.1',
                     'postgres','password',
                     { quote_char => q{"}, name_sep => q{.},
                       on_connect_do => ['SET search_path TO catalogo, pg_catalog'],
                     }],
    
);

1;

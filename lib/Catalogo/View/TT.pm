package Catalogo::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

Catalogo::View::TT - TT View for Catalogo

=head1 DESCRIPTION

TT View for Catalogo.

=head1 SEE ALSO

L<Catalogo>

=head1 AUTHOR

Henrique Mota,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

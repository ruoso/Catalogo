package Catalogo;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    Authentication
    Unicode
    ConfigLoader
    Static::Simple
/;

__PACKAGE__->config( 'Plugin::Authentication' =>
                    {
                        default_realm => 'members',
                        realms => {
                            members => {
                                credential => {
                                    class => 'Password',
                                    password_field => 'password',
                                    password_type => 'clear'
                                },
                                store => {
                                    class => 'Minimal',
                                    users => {
                                        bob => {
                                            password => "123",
                                            editor => 'yes',
                                            roles => [qw/edit delete/],
                                        },
                                        william => {
                                            password => "456",
                                            roles => [qw/comment/],
                                        }
                                    }
                                }
                            }
                        }
                    }
    );

extends 'Catalyst';

our $VERSION = '0.01';
$VERSION = eval $VERSION;

# Configure the application.
#
# Note that settings in catalogo.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'Catalogo',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

Catalogo - Catalyst based application

=head1 SYNOPSIS

    script/catalogo_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Catalogo::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Henrique Mota,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

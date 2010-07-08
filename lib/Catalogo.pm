package Catalogo;
use Moose;
use namespace::autoclean;
use Catalyst::Runtime 5.80;

use Catalyst qw/
    -Debug
    Authentication
    Unicode
    Session
    Session::Store::FastMmap
    Session::State::Cookie
    ConfigLoader
    Static::Simple
/;


# autenticacao para desenvolvimento
__PACKAGE__->config(     );

extends 'Catalyst';

our $VERSION = '0.01';
$VERSION = eval $VERSION;

__PACKAGE__->config
  ( name => 'Catalogo',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    # test auth
    'Plugin::Authentication' =>
    { default_realm => 'members',
      realms =>
      { members =>
        { credential =>
          { class => 'Password',
            password_field => 'password',
            password_type => 'clear' },
          store =>
          { class => 'Minimal',
            users =>
            { bob =>
              { password => "123",
                editor => 'yes',
                roles => [qw/edit delete/] },
              william =>
              { password => "456",
                roles => [qw/comment/] } } } } } }
  );

# Start the application
__PACKAGE__->setup();

sub place_bread {
    my ($self, $uri, $label) = @_;

    my $bc = $self->session->{breadcrumb} || [];
    $bc = [ grep { $_->{uri} &&
                     $_->{uri} ne $uri } @$bc ];

    push @$bc, { uri => $uri, label => $label };
    splice @$bc, 0, -5;

    $self->session->{breadcrumb} = $bc;

    return undef;
};

sub breadcrumb {
    my ($self) = @_;
    return $self->session->{breadcrumb};
}

1;

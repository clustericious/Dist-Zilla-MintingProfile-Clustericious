package Dist::Zilla::MintingProfile::Clustericious;

# ABSTRACT: Minting profile for Clustericious clients and servers
# VERSION

=head1 SYNOPSIS

 # create a new app without database
 % dzil new -P Clustericious Foo

 # create a new app with database
 % dzil new -P Clustericious -p mbd_app Foo

 # create a new client, NOTE: name must end in ::Client
 % dzil new -P Clustericious -p client Foo::Client

=head1 DESCRIPTION

This minting profile is used to generate stub Clustericious
applications in a L<Dist::Zilla> context.

=cut

use Moose;
use v5.10;

with qw( Dist::Zilla::Role::MintingProfile );

use namespace::autoclean;
use File::ShareDir qw( dist_dir );
use Path::Class qw( dir file );

sub profile_dir
{
  my($self, $name) = @_;

  $name = 'app' if $name eq 'default';
  my $dir;

  if(defined $ENV{DIST_ZILLA_MINTING_PROFILE_CLUSTERICIOUS})
  {
    $dir = dir( $ENV{DIST_ZILLA_MINTING_PROFILE_CLUSTERICIOUS} )->subdir($name);
  }
  elsif(defined $Dist::Zilla::MintingProfile::Clustericious::VERSION)
  {
    $dir = dir(dist_dir('Dist-Zilla-MintingProfile-Clustericious'))
      ->subdir($name);
  }
  else
  {
    # If $VERSION is not defined, then we are running out of a dist
    # that hasn't been dzil builded yet, so find the share directory
    # relative to this .pm file.
    $dir = file(__FILE__)
      ->absolute
      ->dir
      ->parent
      ->parent
      ->parent
      ->parent
      ->subdir('share')
      ->subdir($name);
  }
  
  die "no such Clustericious profile $name" unless -d $dir;

  $dir;
}

__PACKAGE__->meta->make_immutable;

1;

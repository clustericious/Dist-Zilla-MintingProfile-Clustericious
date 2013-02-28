package Dist::Zilla::MintingProfile::Clustericious;

use Moose;
use v5.10;

with qw( Dist::Zilla::Role::MintingProfile );

use namespace::autoclean;
use File::ShareDir qw( dist_dir );
use Path::Class qw( dir file );

# ABSTRACT: Minting profile for Clustericious clients and servers
# VERSION

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
      ->subdir('public')
      ->subdir($name);
  }
  
  die "no such Clustericious profile $name" unless -d $dir;

  $dir;
}

__PACKAGE__->meta->make_immutable;

1;

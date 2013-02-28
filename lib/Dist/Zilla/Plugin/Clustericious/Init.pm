package Dist::Zilla::Plugin::Clustericious::Init;

# ABSTRACT: Generate new Clustericious dist from templates
# VERSION

use Moose;
use v5.10;
use Dist::Zilla::File::InMemory;
use Mojo::Template;
use Dist::Zilla::MintingProfile::Clustericious;

with 'Dist::Zilla::Role::ModuleMaker';

use namespace::autoclean;

has type => (
  is       => 'ro',
  isa      => 'Str',
  required => 1,
);

sub _recurse
{
  my($self, $class, $srcdir, $destdir) = @_;
  
  foreach my $child ($srcdir->children)
  {
    my $dest = join '/', $destdir, do {
      my $base = $child->basename;
      
      $base =~ s/APPCLASS/$class/eg;

      my $path = $class;
      $path =~ s/::/\//g;
      $base =~ s/APPPATH/$path/eg;
      
      my $name = lc $class;
      $name =~ s/::/_/g;
      $base =~ s/APPNAME/$name/eg;
      
      $base;
    };
    if($child->is_dir)
    {
      $self->_recurse($class, $child, $dest);
    }
    else
    {
      my $file = Dist::Zilla::File::InMemory->new(
        name    => $dest,
        mode    => $dest =~ m{^/bin/} ? 0755 : 0644,
        content => do {
          my $txt = Mojo::Template->new(name => $child->stringify)->render(
            '% my $class = "' . $class . "\";\n" .
            $child->slurp
          );
          die $txt if ref $txt;
          $txt;
        },
      );
      $self->zilla->log("adding $dest");
      $self->add_file($file);
    }
  }
}

sub make_module
{
  my($self, $args) = @_;

  my $class = $args->{name};
  if($self->type eq 'client')
  {
    unless($class =~ /::Client$/)
    {
      die "client dist name should end in ::Client";
    }
    $class =~ s/::Client$//;
  }

  my $dir = $self->zilla->root->subdir('template');
  
  unless(-d $dir)
  {
    $dir = Dist::Zilla::MintingProfile::Clustericious
      ->profile_dir($self->type)
      ->subdir('template');
  }
  
  $self->_recurse(
    $class, 
    $dir,
    '',
  );
  
  return;
}

__PACKAGE__->meta->make_immutable;

1;

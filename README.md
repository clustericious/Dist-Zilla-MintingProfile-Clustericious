# NAME

Dist::Zilla::MintingProfile::Clustericious - Minting profile for Clustericious clients and servers

# VERSION

version 0.02

# SYNOPSIS

    # create a new app without database
    % dzil new -P Clustericious Foo

    # create a new app with database
    % dzil new -P Clustericious -p mbd_app Foo

    # create a new client, NOTE: name must end in ::Client
    % dzil new -P Clustericious -p client Foo::Client

# DESCRIPTION

This minting profile is used to generate stub Clustericious
applications in a [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) context.

# AUTHOR

Graham Ollis &lt;plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by NASA GSFC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

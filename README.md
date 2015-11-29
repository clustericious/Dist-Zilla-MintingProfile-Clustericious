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

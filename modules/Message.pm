#==============================================================================
#
# Bot::BasicBot::Pluggable::Module::Message
#
# DESCRIPTION
#
# AUTHOR
#   Gryphon Shafer <gryphon@cpan.org>
#
# COPYRIGHT
#   Copyright (C) 2008 by Gryphon Shafer
#
#   This library is free software; you can redistribute it and/or modify it
#   under the same terms as Perl itself.
#
#==============================================================================

package Bot::BasicBot::Pluggable::Module::Message;
use strict;
use warnings;
use Bot::BasicBot::Pluggable::Module;
use base 'Bot::BasicBot::Pluggable::Module';

our $VERSION = 0.01;

sub said {
    my ( $self, $message, $priority ) = @_;
    return unless ( $priority == 2 );

    ( my $msg_body = $message->{'body'} ) =~ s/^\s+//;
    if (
        $msg_body =~ /^(\S+)\s+(\S+)\s+(.+)$/ and
        lc($1) eq 'tell'
    ) {
        my $nick  = lc($2);
        my $notes = $self->get($nick) || [];

        push( @{$notes}, {
            'who'     => $message->{'who'},
            'message' => $3,
        } );

        $self->set( $nick, $notes );
        $self->reply( $message, q(OK. I'll deliver the message.) );
    }

    return;
}

sub chanjoin {
    my ( $self, $message ) = @_;
    my $notes = $self->get( lc( $message->{'who'} ) ) || [];

    foreach ( @{$notes} ) {
        $self->reply(
            $message,
            $_->{'who'} . ' asked me to tell you ' . $_->{'message'},
        );
    }

    $self->unset( lc( $message->{'who'} ) );
    return;
}

sub help {
    return 'tell <nick> [that] <message>';
}

1;
__END__

=pod
=head1 NAME

Bot::BasicBot::Pluggable::Module::Message - Echo Twitter comments

=head1 VERSION

This document describes Bot::BasicBot::Pluggable::Module::Message version 0.01

=head1 DESCRIPTION

This module adds the ability for Bot::BasicBot::Pluggable IRC bots to accept
messages from IRC users for other users who are offline, then the bot will
tell the message to that user when he/she logs in next to a given channel.

=head1 IRC INTERFACE

=over 4

=item tell <nick> [that] <message>

Instructs the bot to tell nick the message when nick logs in next.

=back

=head1 AUTHOR

Gryphon Shafer E<lt>gryphon@cpan.orgE<gt>

    code('Perl') || die;

=head1 ACKNOWLEDGEMENTS

Thanks to Larry Wall for Perl, Randal Schwartz for my initial and on-
going Perl education, Damian Conway for mental inspiration, Sam Tregar for
teaching me how to write and upload CPAN modules, and the monks of PerlMonks
for putting up with my foolishness.

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2008, Gryphon Shafer E<lt>gryphon@cpan.orgE<gt>.
All rights reserved.

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=head1 DISCLAIMER OF WARRANTY

Because this software is licensed free of charge, there is no warranty for
the software to the extent permitted by applicable law. Except when
otherwise stated in writing, the copyright holders and/or other parties
provide the software "as is" without warranty of any kind, either expressed
or implied, including but not limited to the implied warranties of
merchantability and fitness for a particular purpose. The entire risk as to
the quality and performance of the software is with the user. Should the
software prove defective, the user shall assume the cost of all necessary
servicing, repair, or correction.

In no event unless agreed to in writing will any copyright holder or any
other party who may modify and/or redistribute the software as permitted by
the above licence be liable to the user for damages including any general,
special, incidental, or consequential damages arising out of the use or
inability to use the software (including but not limited to loss of data or
data being rendered inaccurate or losses sustained by you or third parties
or a failure of the software to operate with any other software), even if
such holder or other party has been advised of the possibility of such
damages.

=cut

package Bot::BasicBot::Pluggable::Module::Redirect;
use warnings;
use strict;
use base qw(Bot::BasicBot::Pluggable::Module);

sub chanjoin {
    my ($self, $mess) = @_;
    if ($self->bot->{server} eq 'irc.gryphonshafer.com') {
        $self->reply($mess, "Hey, how about ditching this place for irc.genericorp.net so Gryphon doesn't get too upset with Dan P.?");
    }
    return;
}

1;

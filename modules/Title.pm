package Bot::BasicBot::Pluggable::Module::Title;
use Bot::BasicBot::Pluggable::Module::Base;
use base qw(Bot::BasicBot::Pluggable::Module::Base);

=head1 NAME

Bot::BasicBot::Pluggable::Module::Title

=head1 SYNOPSIS

Speak the title of urls mentioned in channel

=head1 IRC USAGE

None. If the module is loaded, the bot will speak the titles of all web pages mentioned.

=cut

use URI::Title qw(title);
use URI::Find;
use URI::Find::Simple qw(list_uris);

sub help {
    return "will speak the title of any wab page mentioned in channel, unless marked spoiler";
}

sub said {
    my ($self, $mess, $pri) = @_;

    return unless ($pri == 0); # respond to everything mentioned.
    return if $mess->{body} =~ /spoiler/i; # unless it would spoil the surprise

    my $maxlen = $self->get("user_max_length");

    my $reply = "";
    for (URI::Find::Simple::list_uris($mess->{body})) {
      next if $maxlen && $maxlen < length; 
      s{https?://plus\.google\.com/\K#}{};
      my $title = title($_);
      $reply .= "[ $title ] " if $title && $title ne "Twitter" && $title ne "Google";
    }
    $self->reply($mess, $reply) if $reply;

    return 0;
}

*emoted = \&said;

1;


package Bot::BasicBot::Pluggable::Module::Meeting;

use strict;
use warnings;
#use LWP::Simple "get";
#use Time::Local "timelocal";

use Bot::BasicBot::Pluggable::Module;
BEGIN { our @ISA = qw(Bot::BasicBot::Pluggable::Module); }

sub said {
    my ($self, $mess, $pri) = @_;
    return if $pri != 2;

    my $body = $mess->{body};
    return if $body !~ /^meeting\b/;
    my $meeting = $self->get("user_meeting_time");
    return unless $meeting;

    return $self->get("user_meeting_name") . " in " . ($meeting-time()) . " seconds";
}

my $last_log = -1;
sub tick {
    my $self = shift;
    my $meeting = $self->get("user_meeting_time");
    return unless $meeting && $meeting > time();
    my @channels = split /,/, $self->get("user_meeting_announce_channels") || '';
    return unless @channels;
    my $log = int(log($meeting-time())/log(2));

    if ($log != $last_log) {
        if ($last_log != -1) {
            for my $channel (@channels) {
                $self->say(channel => $channel, body => $self->get("user_meeting_name") . " in " . ($meeting-time()) . " seconds" ) if $last_log != -1;
            }
        }
        $last_log = $log;
    }
    return;
}

sub help {
    return "Commands: 'meeting'";
}

1;

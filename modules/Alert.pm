package Bot::BasicBot::Pluggable::Module::Alert;

# monitors a directory for new files containing messages to deliver (and deletes them)

use strict;
use warnings;
use File::Slurp 'read_file';

use Bot::BasicBot::Pluggable::Module;
BEGIN { our @ISA = qw(Bot::BasicBot::Pluggable::Module); }

sub _get_alerts {
    my $self = shift;
    my @alerts;

    my $dir = $self->get("user_directory");
    return if $dir =~ /[^\w\/]/;

    chomp( my @files = `ls -t $dir` );
    if (@files) {
    	my $prefix = $self->get("user_message_prefix") || '';
	$prefix .= ' ' if $prefix;
	@files = map "$dir/$_", @files;
	@alerts = map $prefix . read_file($_), @files;
	unlink @files;
    }

    return @alerts
}

my $last_time = 0;
sub tick {
    my $self = shift;
    my $interval = $self->get("user_interval") || 60;
    return unless time() - $last_time >= $interval;
    $last_time = time();

    my @alerts = $self->_get_alerts();
    return unless @alerts;

    my @channels = split /,/, $self->get("user_alert_channels") || '';
    return unless @channels;

    for my $channel (@channels) {
        $self->say(channel => $channel, body => join("\n", @alerts))
    }
    return;
}

sub help {
    return "No user serviceable parts";
}

1;

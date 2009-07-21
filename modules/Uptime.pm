package Bot::BasicBot::Pluggable::Module::Uptime;
use Bot::BasicBot::Pluggable::Module::Base;
use base qw(Bot::BasicBot::Pluggable::Module::Base);

=head1 NAME

Bot::BasicBot::Pluggable::Module::Uptime

=head1 SYNOPSIS

Report system uptime

=head1 IRC USAGE

uptime

=cut

sub help {
    return "Are you joking or a joke?";
}

sub said {
    my ($self, $mess, $pri) = @_;
    my @match;

    return unless ($pri == 1);
    return unless $mess->{body} =~ /^uptime\b/i;

    my ($uptime) = `uptime` =~ /up\s+(\S+)/;
    $uptime =~ s/,$//;
    my $reply = ( $uptime ? "$uptime :(" : "Dunno" );
    $self->reply($mess, $reply) if $reply;
    return 1;
}

1;


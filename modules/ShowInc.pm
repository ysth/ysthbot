package Bot::BasicBot::Pluggable::Module::ShowInc;

use strict;
use Data::Dumper;
use Bot::BasicBot::Pluggable::Module; 
use base qw(Bot::BasicBot::Pluggable::Module);

sub said { 
    my ($self, $mess, $pri) = @_;

    my $body = $mess->{body}; 
    my $who  = $mess->{who};

    return unless ($pri == 2);

    return unless $body =~ /^showinc$/;

    local $Data::Dumper::Terse = 1;
    local $Data::Dumper::Indent = 1;
    warn Dumper([sort keys %INC]);
    return 'sort keys %INC dumped to stderr';
}

sub help {
    return "Commands: 'showinc'";
}

1;

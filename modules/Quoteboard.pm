package Bot::BasicBot::Pluggable::Module::Quoteboard;

use strict;
use warnings;
use LWP::Simple "get";
use CGI;

use Bot::BasicBot::Pluggable::Module; 
BEGIN { our @ISA = qw(Bot::BasicBot::Pluggable::Module); }

sub said { 
    my ($self, $mess, $pri) = @_;
    return if $pri != 2;

    my $body = $mess->{body}; 
    return if $body !~ s/^quote\W\s*//;

    return get("http://ysth.perlmonk.org/quoteboard/foo.cgi?bar=".CGI->escape($body));
}

sub help {
    return "Commands: 'quote'";
}

1;

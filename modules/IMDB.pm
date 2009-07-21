package Bot::BasicBot::Pluggable::Module::IMDB;

use strict;
use Bot::BasicBot::Pluggable::Module; 
use base qw(Bot::BasicBot::Pluggable::Module);


sub said { 
    my ($self, $mess, $pri) = @_;

    my $body = $mess->{body}; 
    my $who  = $mess->{who};

    return unless ($pri == 2);

    return unless $body =~ s!^\s*imdb (for )?!!;

    (my $q = $body) =~ s/(\W)/sprintf "%%%02X", ord $1/ge;
    my $url = "http://www.imdb.com/find?s=tt&q=$q";
    return "$body can be found at $url";

}

sub help {
    return "Commands: 'imdb (for ) <word>'";
}

1;

=head1 NAME

Bot::BasicBot::Pluggable::Module::IMDB - give the url of a search on IMDB

=head1 SYNOPSIS

This is almost useless but it's provided as part of Infobot backwards compatability.

=head1 IRC USAGE

    imdb (for ) <word> [ <date> ]

=head1 AUTHOR

Simon Wistow, <simon@thegestalt.org>

=head1 COPYRIGHT

Copyright 2005, Simon Wistow

Distributed under the same terms as Perl itself.

=head1 SEE ALSO


=cut 


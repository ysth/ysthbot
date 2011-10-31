package Bot::BasicBot::Pluggable::Module::Tweets;

use strict;
use Bot::BasicBot::Pluggable::Module;
use base qw(Bot::BasicBot::Pluggable::Module);

use LWP::Simple ();
use JSON::XS ();

my $api_url = 'http://api.twitter.com/1/statuses/show.json?id=%d';
my $response = '@%s: %s';
sub said {
    my ($self, $mess, $pri) = @_;

    my $body = $mess->{body};
    my $who  = $mess->{who};

#    warn "$who said $body with priority $pri\n";
    return unless ($pri == 2);
    return unless my($user,$tid) = ($body =~ m{https?://twitter.com/\#!/([^/]+)/status/(\d+)});

    my $url = sprintf($api_url, $tid);
#    warn "get $url";
    my $tweet_json = LWP::Simple::get( $url ) || return;
#    warn $tweet_json;

    my $tweet = eval { JSON::XS::decode_json( $tweet_json ) } || return;

    return sprintf( $response, $tweet->{user}{screen_name}, $tweet->{text} );
}

sub help {
    return 'You had me at "twitter.com"';
}

1;

__END__

=head1 NAME

Bot::BasicBot::Pluggable::Module::Tweets - parses links to twitter status updates, returns the text of the update

=head1 IRC USAGE

    http://twitter.com/#!/$user/status/$id

=head1 AUTHOR

Ivan Heffner <iheffner+tweets@gmail.com>

=head1 COPYRIGHT

Copyright 2011, Ivan Heffner

Distributed under the same terms as Perl itself.

=head1 SEE ALSO

=cut

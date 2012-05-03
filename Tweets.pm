package Bot::BasicBot::Pluggable::Module::Tweets;

use strict;
use Bot::BasicBot::Pluggable::Module;
use base qw(Bot::BasicBot::Pluggable::Module);

use LWP::Simple ();
use JSON::XS ();

sub said {
    my ($self, $mess, $pri) = @_;

    my $body = $mess->{body};
    my $who  = $mess->{who};

#    warn "$who said $body with priority $pri\n";
    return unless ($pri == 2);

    if (my($user,$tid) = ($body =~ m{https?://twitter.com/\#!/([^/]+)/status/(\d+)})) {
        return _single_status($user, $tid);
    }
    elsif (($user) = ($body =~ m{https?://twitter.com/\#!/([^/]+)$})) {
        return _tweet_stream($user,5);
    }
    else {
        return;
    }
}

sub _single_status {
    my($username,$id) = @_;

    my $response = '@%s: %s';

    my $uri = 'http://api.twitter.com/1/statuses/show.json?id=%d';
    my $tweet = _fetch( sprintf( $uri, $id ) ) || return;

    return sprintf( $response, $tweet->{user}{screen_name}, $tweet->{text} );
}

sub _tweet_stream {
    my($username,$count) = @_;
    my $uri = 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=%s&count=%d';
    my $stream = _fetch( sprintf( $uri, $username, $count ) );

    return unless $stream;

    my $response = join "\n",
       map {
           sprintf('[%s] @%s: %s',
               _time( $_->{created_at} ), $username, $_->{text}
           )
       } @$stream;

    return $response;
}

sub _fetch {
    my($url) = @_;
#    warn "get $url";
    my $resp_json = LWP::Simple::get( $url );
#    warn $tweet_json;

    return eval { JSON::XS::decode_json( $resp_json ) };
}

my %month = (
    Jan => 1,
    Feb => 2,
    Mar => 3,
    Apr => 4,
    May => 5,
    Jun => 6,
    Jul => 7,
    Aug => 8,
    Sep => 9,
    Oct => 10,
    Nov => 11,
    Dec => 12,
);

sub _time {
    my ($created) = @_;

    my($dow,$mon,$dom,$h,$m,$s,$offset,$year) =
            ($created =~ /^(\w+) (\w+) (\d+) (\d+):(\d+):(\d+) ([+-]\d+) (\d+)$/);

#    warn "month: $mon => $month{$mon}\n";
    return sprintf('%04d/%02d/%02d %02d:%02d:%02d',$year,$month{$mon},$dom,$h,$m,$s);
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

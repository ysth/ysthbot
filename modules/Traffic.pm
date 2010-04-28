package Bot::BasicBot::Pluggable::Module::Traffic;

use strict;
use warnings;
use LWP::Simple "get";
use Time::Local "timelocal";

use Bot::BasicBot::Pluggable::Module;
BEGIN { our @ISA = qw(Bot::BasicBot::Pluggable::Module); }

sub _get_incidents {
    my ($explicit) = @_;

    # TODO: If-Modified-Since
    my $report = get("http://www.wsdot.wa.gov/traffic/seattle/incidents/");

    ($report) = $report =~ m!(<p>Seattle area alerts for .*?)</div>!s
        or return "traffic parse error: incidents not found";

	my ($title,@types) = $report =~ m!<p[^>]*>([^<]*)</p>!gs;

	$title =~ s/(area) (alerts)/$1 traffic $2/;

	my %reports;
	for my $list ( $report =~ m!<ul>(.*?)</ul>!gs ) {
		my $type = shift @types; # pull off the first type
		my @incidents = $list =~ m!<li>(.*?)</li>!gs;
		next if $incidents[0] eq 'None reported';
		$reports{$type} = \@incidents;
		push @types, $type;      # push it back on to the list
	}

	# make a report kind of like so:
	# Seattle area traffic reports for MM/DD/YYY HH:MM AMPM
	# Blocking Incidents
	#   * None reported
	# Construction Closures
	#   * US99 viaduct closed
	# Special Events
	#   * OMG! IT'S THE MARINERS! RUN FOR YOUR LIVES!
	my $msg = (keys %reports)
		? join("\n", $title,  map { $_, map { '  * '.$_ } @{ $reports{$_} } } @types )
		: "$title\nNothing to report";

	if ($explicit) {
		for my $swap ( _get_swaps() ) {
			$msg =~ s/$swap->{'pattern'}/$swap->{'replacement'}/g
		}
	}

    return $msg;
}

sub _next_alert {
    my $time = shift() || time();

    # get date 6h45m1s hence
    my ($mday, $mon, $year, $wday) = (localtime($time + 6*3600 + 45*60 + 1))[3..6];

    # alert at 17:15:00 on that day
    my $next = timelocal(0, 15, 17, $mday, $mon, $year);
    # but no alerts on weekends
    $next = _next_alert($next) if $wday == 0 || $wday == 6;

    return $next;
}

sub said {
    my ($self, $mess, $pri) = @_;
    return if $pri != 2;

    my $body = $mess->{body};
    return if $body !~ /^traffic\b/;

    _get_incidents(1);
}

my $next_alert = _next_alert();
sub tick {
    my $self = shift;
    return if time() < $next_alert;
    $next_alert = _next_alert();

    $self->say(channel => "#spqr", body => _get_incidents());
    return;
}

sub help {
    return "Commands: 'traffic'";
}

{
    my @swaps = (
        # pattern, replacement, exact only
        [ q/\bblocking\b/, 'blogging', ],
        [ q/\bplan accordingly\b/, 'play accordian', ],
        [ q/\broadwork\b/, 'Men at Work', ],
        [ q/\bmaintenance\b/, 'Men at Work', ],
    );

    sub _get_swaps {
        return map {
            ( +{ 'pattern' => qr/$_->[0]/ , 'replacement' => $_->[1]  },
                $_->[2]  # special "exact" flag
                    ? () # empty list
                    : +{ 'pattern' => qr/$_->[0]/i, 'replacement' => uc($_->[1]) },
            )
        } @swaps;
    }
}
1;

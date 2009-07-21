package Bot::BasicBot::Pluggable::Module::Stockquote;

use strict;
use Bot::BasicBot::Pluggable::Module; 
use base qw(Bot::BasicBot::Pluggable::Module);

use Finance::Quote;

my %cache;

sub said { 
    my ($self, $mess, $pri) = @_;

    my $body = $mess->{body}; 
    my $who  = $mess->{who};

    return unless ($pri == 2);

    return unless $body =~ m!(?:^|,\s+)(?:stock)?quote\s+([A-Z]{3,4})\s*$!i;
    my $symbol = uc($1);

    my %tried;
    for my $restrict (qw/usa other/) {
# stupid module stores things in globals that should be attributes
    local %Finance::Quote::METHODS;
    local %Finance::Quote::MODULES;
    *Finance::Quote::METHODS = ($cache{$restrict}{METHODS} ||= {});
    *Finance::Quote::MODULES = ($cache{$restrict}{MODULES} ||= {});
    my $q = Finance::Quote->new( $restrict eq "usa" ? "Yahoo::USA" : () )
        or return "Finance quoting seems to be broken";

    my @sources = $q->sources;
    foreach my $source (@sources) {
        next if $tried{$source}++;
        my %hash = $q->fetch($source, $symbol);
        next unless defined $hash{$symbol,'price'};

        my $name = $hash{$symbol,'name'} || '';
        $name = " ($name)" if $name;
        return sprintf "At %s %s, %s%s traded%s at %s %s, according to %s", $hash{$symbol,'isodate'}, 
                                                   $hash{$symbol,'time'}, 
                                                   $symbol, $name,
                                                   $hash{$symbol,'exchange'} && " on $hash{$symbol, 'exchange'}",
                                                   $hash{$symbol,'last'},
                                                   $hash{$symbol,'currency'},
                                                   $hash{$symbol,'source'} || $source;
    }
    
    }


    return "Couldn't get a value for $symbol";
}

sub help {
    return "Commands: 'stockquote <TICKER>'";
}

1;

=head1 NAME

Bot::BasicBot::Pluggable::Module::Stockquote - Get stock quote


=head1 SYNOPSIS
    
This allows you to get a stock quote for a symbol from various stock services

=head1 IRC USAGE

    quote <LETTER-TICKERNAME>

=head1 AUTHOR

Simon Wistow, <simon@thegestalt.org>

=head1 COPYRIGHT

Copyright 2005, Simon Wistow

Distributed under the same terms as Perl itself.

=head1 SEE ALSO


=cut 


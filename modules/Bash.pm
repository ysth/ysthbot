package Bot::BasicBot::Pluggable::Module::Bash;

use strict;
use Bot::BasicBot::Pluggable::Module; 
use base qw(Bot::BasicBot::Pluggable::Module);

use XML::RSS;
use LWP::Simple ();
use HTML::Entities;

sub said { 
    my ($self, $mess, $pri) = @_;

    my $body = $mess->{body}; 
    my $who  = $mess->{who};

    return unless ($pri == 2);
    return unless $body =~ /^\s*bash\s+(\d+)/i;
   
    my $description;
    my $id = $1;
    my $rss = LWP::Simple::get("http://www.bash.org/xml/?$id");
    if (defined $rss) {
    
    my $p = XML::RSS->new();
    $p->parse($rss)                    || return "Couldn't parse the data I got :(";
    my $item = shift @{$p->{'items'}}  || return "Couldn't parse the data I got :(";

    $description = $item->{'description'};	
    }
    else {
        # fall back on html; the xml feed has been down for years, I think
        my $html = LWP::Simple::get("http://www.bash.org/?$id");
        my ($quote) = ($html||"") =~ m!<p class="qt">(.*?)</p>!s;
        ($description = $quote) =~ s!<br />!!g;
        $description =~ y/\r//;
    }
 
    return "$id is not a valid Bash id apparently" if (!defined $description || $description eq 'The IRC Quote Database');

    $description = decode_entities($description);
    $description =~ s!<br\s*\/?>!\n!gi;
    return "${id}: $description";

}

sub help {
    return "Commands: 'bash <id>'";
}

1;

__END__


=head1 NAME

Bot::BasicBot::Pluggable::Module::Bash - get quotes from bash.org

=head1 IRC USAGE

	bash <id>

=head1 AUTHOR

Simon Wistow, <simon@thegestalt.org>

=head1 COPYRIGHT

Copyright 2005, Simon Wistow

Distributed under the same terms as Perl itself.

=head1 SEE ALSO

=cut 


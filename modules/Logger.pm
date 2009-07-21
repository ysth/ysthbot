package Bot::BasicBot::Pluggable::Module::Logger;
use warnings;
use strict;
use base qw(Bot::BasicBot::Pluggable::Module);

use Data::Dumper;
$Data::Dumper::Useqq=$Data::Dumper::Terse=1;
$Data::Dumper::Indent=0;

sub said {
    my ($self, $mess, $pri) = @_;
    if ($pri == 0) {
        open my $fh, ">>", "channel.log" or warn "huh? $!";
        print $fh Dumper({said=>1,'localtime'=>~~localtime,mess=>$mess}), "\n";
        if ($mess->{body} =~/checkout bot/) { print $fh Dumper($self->bot) }
    }
    return;
}

sub emoted {
    my ($self, $mess, $pri) = @_;
    if ($pri == 0) {
        open my $fh, ">>", "channel.log" or warn "huh? $!";
        print $fh Dumper({emoted=>1,'localtime'=>~~localtime,mess=>$mess}), "\n";
    }
    return;
}
sub chanjoin {
    my ($self, $mess) = @_;
    open my $fh, ">>", "channel.log" or warn "huh? $!";
    print $fh Dumper({chanjoin=>1,'localtime'=>~~localtime,mess=>$mess}), "\n";
    return;
}
sub chanpart {
    my ($self, $mess) = @_;
    open my $fh, ">>", "channel.log" or warn "huh? $!";
    print $fh Dumper({chanpart=>1,'localtime'=>~~localtime,mess=>$mess}), "\n";
    return;
}

1;

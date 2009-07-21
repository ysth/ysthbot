package Bot::BasicBot::Pluggable::Module::Python;
use Bot::BasicBot::Pluggable::Module::Base;
use base qw(Bot::BasicBot::Pluggable::Module::Base);

=head1 NAME

Bot::BasicBot::Pluggable::Module::Python

=head1 SYNOPSIS

Helpful links for python mentioners

=head1 IRC USAGE

python

=cut

#use URI::Title qw(title);

my @links = split /^/,
q!http://www.serve.com/bonzai/monty/classics/ArthurTwoShedsJackson
http://www.serve.com/bonzai/monty/classics/BuryingtheCat
http://www.serve.com/bonzai/monty/classics/Cinema-TelevisionInterview
http://www.serve.com/bonzai/monty/classics/GavinMillarrrrrWrites
http://www.serve.com/bonzai/monty/classics/IveGotTwoLegs
http://www.serve.com/bonzai/monty/classics/JohannGambolputty...ofUlm
http://www.serve.com/bonzai/monty/classics/Me,Doctor
http://www.serve.com/bonzai/monty/classics/MedicalLove
http://www.serve.com/bonzai/monty/classics/MissAnneElk
http://www.serve.com/bonzai/monty/classics/NudgeNudge,KnowWhatIMean
http://www.serve.com/bonzai/monty/classics/OriginalBookshopSketch
http://www.serve.com/bonzai/monty/classics/RockNotes
http://www.serve.com/bonzai/monty/classics/Self-defenseAgainstFruit
http://www.serve.com/bonzai/monty/classics/SermonontheMount
http://www.serve.com/bonzai/monty/classics/SpottheBrainCell
http://www.serve.com/bonzai/monty/classics/St.VictorofPython
http://www.serve.com/bonzai/monty/classics/StakeYourClaims
http://www.serve.com/bonzai/monty/classics/TheAdvertisingSketch
http://www.serve.com/bonzai/monty/classics/TheAirlinePilotsSketch
http://www.serve.com/bonzai/monty/classics/TheAlbatrossSketch
http://www.serve.com/bonzai/monty/classics/TheArchitectSketch
http://www.serve.com/bonzai/monty/classics/TheArgumentClinicSketch
http://www.serve.com/bonzai/monty/classics/TheAustralianTableWineSketch
http://www.serve.com/bonzai/monty/classics/TheBanterSketch
http://www.serve.com/bonzai/monty/classics/TheBarberShopSketch
http://www.serve.com/bonzai/monty/classics/TheBicycleRepairManSketch
http://www.serve.com/bonzai/monty/classics/TheBlackmailSketch
http://www.serve.com/bonzai/monty/classics/TheBlessingfromtheLord
http://www.serve.com/bonzai/monty/classics/TheBookshopSketch
http://www.serve.com/bonzai/monty/classics/TheBraveandBoldSirRobin
http://www.serve.com/bonzai/monty/classics/TheBruces
http://www.serve.com/bonzai/monty/classics/TheBuyingtheBedSketch
http://www.serve.com/bonzai/monty/classics/TheCheeseShopSketch
http://www.serve.com/bonzai/monty/classics/TheChurchBells
http://www.serve.com/bonzai/monty/classics/TheCompleteSwampCastle
http://www.serve.com/bonzai/monty/classics/TheContradictionSketch
http://www.serve.com/bonzai/monty/classics/TheCrunchyFrogSketch
http://www.serve.com/bonzai/monty/classics/TheCyclingSketch
http://www.serve.com/bonzai/monty/classics/TheDeadBishopSketch
http://www.serve.com/bonzai/monty/classics/TheDeadParrotSketch
http://www.serve.com/bonzai/monty/classics/TheDinosaurSketch
http://www.serve.com/bonzai/monty/classics/TheElectionSketch
http://www.serve.com/bonzai/monty/classics/TheFishLicenceSketch
http://www.serve.com/bonzai/monty/classics/TheHagglingSketch
http://www.serve.com/bonzai/monty/classics/TheHairDressersonMtEverest
http://www.serve.com/bonzai/monty/classics/TheHungarianPhrasebookSketch
http://www.serve.com/bonzai/monty/classics/TheKnightsWhoSayNi
http://www.serve.com/bonzai/monty/classics/TheLifeboatSketch
http://www.serve.com/bonzai/monty/classics/TheManWhoSpeaksinAnagrams
http://www.serve.com/bonzai/monty/classics/TheManwithThreeButtocks
http://www.serve.com/bonzai/monty/classics/TheMenBeingEatenbyaCrocodile
http://www.serve.com/bonzai/monty/classics/TheMoneyProgrammeSketch
http://www.serve.com/bonzai/monty/classics/TheNewsforParrots
http://www.serve.com/bonzai/monty/classics/TheNorthMineheadBye-election
http://www.serve.com/bonzai/monty/classics/TheOvineAviationSketch
http://www.serve.com/bonzai/monty/classics/ThePackageTourComplaint
http://www.serve.com/bonzai/monty/classics/ThePenguinSketch
http://www.serve.com/bonzai/monty/classics/ThePetShopSketch-1
http://www.serve.com/bonzai/monty/classics/ThePetShopSketch-2
http://www.serve.com/bonzai/monty/classics/ThePiranhaBrothersStory
http://www.serve.com/bonzai/monty/classics/TheRalphMellishStory
http://www.serve.com/bonzai/monty/classics/TheSheepintheTreesSketch
http://www.serve.com/bonzai/monty/classics/TheSpamSketch
http://www.serve.com/bonzai/monty/classics/TheSpanishInquisitionSketch
http://www.serve.com/bonzai/monty/classics/TheStorySoFar
http://www.serve.com/bonzai/monty/classics/TheStringSketch
http://www.serve.com/bonzai/monty/classics/TheTaleofSirGalahad
http://www.serve.com/bonzai/monty/classics/TheTaleofSirLancelot
http://www.serve.com/bonzai/monty/classics/TheUndertakerSketch
http://www.serve.com/bonzai/monty/classics/TheWeAreSoPoorSketch
http://www.serve.com/bonzai/monty/classics/TheWoodySketch
http://www.serve.com/bonzai/monty/classics/WordAssociationFootball!;

sub help {
    return "Part functional, part oyster egg: python [ keyword ]";
}

sub said {
    my ($self, $mess, $pri) = @_;
    my @match;

    return unless ($pri == 0); # respond to everything mentioned.
    return unless $mess->{body} =~ /\bpython\b\s*(\w*)/i;
    my $keyword = "\L$1";

    if ($keyword && (@match = grep 0<=index(lc $_, $keyword), @links)) {
        $reply = $match[rand @match];
    } else {
        $reply = $links[rand @links];
    }

    $self->reply($mess, $reply) if $reply;
    return 0;
}

*emoted = \&said;

1;


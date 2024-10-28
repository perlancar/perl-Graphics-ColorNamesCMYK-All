package Graphics::ColorNamesCMYK::All;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

# BEGIN_CODE
no strict 'refs';
use Data::Dump;
my $t = {};
my $tsummary = {};
for my $m (qw/
                 BannersCom
                 JohnDecemberCom

             /) {
    my $mod = "Graphics::ColorNames::$m";

    (my $modpm = "$mod.pm") =~ s!::!/!g;
    require $modpm;

    my $t2 = &{"$mod\::NamesRgbTable"}();
    die "$m" unless ref $t2 eq "HASH";

    for (keys %$t2) {
        unless (defined $t->{$_}) {
            $t->{$_} = $t2->{$_};
            $tsummary->{$_} = "from $m";
        }
    }
}
print 'our $NAMES_RGB_TABLE = '; dd $t; print ";";
print "\n\n";
print 'our $NAMES_SUMMARIES_TABLE = '; dd $tsummary; print ";";
# END_CODE
# END_CODE

1;
# ABSTRACT: CMYK colors from http://toutes-les-couleurs.com/ (red)

=head1 DESCRIPTION


=head1 SEE ALSO

Other C<Graphics::ColorNamesCMYK::ToutesLesCoulersCom::*> modules.

Other C<Graphics::ColorNamesCMYK::*> modules.

use strict;

use Test::More 0.98 tests => 7;
use Test::More::UTF8;

use lib 'lib';

use_ok 'Acme::Text::Viceversa';                                     # 1
my $v = new_ok('Acme::Text::Viceversa');                            # 2
note "start to upset the strings...";
sleep 1;
note "now => ʍou";
note "˙˙˙sɓuᴉɹʇs ǝɥʇ ʇǝsdn oʇ ʇɹɐʇs";

my $t = '';
is $t = $v->ɐsɹǝʌǝɔᴉΛ('word'), 'pɹoʍ', 'pɹoʍ ɐ ʇǝɓ oʇ pǝǝɔɔns';     # 3

$t = $v->ɐsɹǝʌǝɔᴉΛ('succeed to upset a paragragh');
is $t, 'ɥɓɐɹɓɐɹɐd ɐ ʇǝsdn oʇ pǝǝɔɔns', $t;                          # 4

my $pangram = 'Cwm fjord veg balks nth pyx quiz.';
my $upset = '˙zᴉnb xʎd ɥʇu sʞꞁɐq ɓǝʌ pɹoſ̣ɟ ɯʍↃ';
$t = $v->ɐsɹǝʌǝɔᴉΛ($pangram);
is $t, $upset, 'ɯɐɹɓuɐd ɐ ʇǝɓ oʇ pǝǝɔɔns';                          # 5

my $upset = 'sɓuᴉɹʇs ʇǝsdn ʇǝsdn-ǝɹ oʇ pǝǝɔɔns';
$t = $v->ɐsɹǝʌǝɔᴉΛ($upset);
is $t, 'succeed to re-upset upset strings', $upset;                # 6

$t = <<'END';

use utf8;
use Acme::Text::Viceversa;

my $v = Acme::Text::Viceversa->new();
my $upset = $v->ɐsɹɐʌǝɔᴉʌ('text that you want to make upset');
# ʇǝsdn ǝʞɐɯ oʇ ʇuɐʍ noʎ ʇɐɥʇ ʇxǝʇ
END

$t = $v->ɐsɹǝʌǝɔᴉΛ($t);
is $t, <<'END', 'sɓuᴉɹʇs pǝuᴉꞁ-ᴉʇꞁnɯ ʇǝsdn oʇ pǝǝɔɔns';              # 7
text that you want to make upset #
⋅̕(͵ʇǝsdn ǝʞɐɯ oʇ ʇuɐʍ noʎ ʇɐɥʇ ʇxǝʇ͵)vicevarsa<-ʌ$ = ʇǝsdn$ ʎɯ
⋅̕()ʍǝu<-ɐsɹǝʌǝɔᴉΛ::ʇxǝ⊥::ǝɯɔ∀ = ʌ$ ʎɯ

⋅̕ɐsɹǝʌǝɔᴉΛ::ʇxǝ⊥::ǝɯɔ∀ ǝsn
⋅̕8ɟʇn ǝsn
END

done_testing;


use strict;
use Test::More 0.98 tests => 4;

use utf8;

{
    use lib 'lib';

    # utf8 hack.
    binmode Test::More->builder->$_, ":utf8" for qw/output failure_output todo_output/;
    no warnings 'redefine';
    my $code = \&Test::Builder::child;
    *Test::Builder::child = sub {
        my $builder = $code->(@_);
        binmode $builder->output,         ":utf8";
        binmode $builder->failure_output, ":utf8";
        binmode $builder->todo_output,    ":utf8";
        return $builder;
    };

    use_ok 'Acme::Text::ɐsɹǝʌǝsᴉΛ';                                     # 1
    my $v = new_ok('Acme::Text::ɐsɹǝʌǝsᴉΛ');                            # 2
    my $t = '';
    is $t = $v->ɐsɹɐʌǝɔᴉʌ('text'), 'ʇxǝʇ', "$t ʇǝɓ oʇ pǝǝɔɔns";         # 3
     is $t = $v->ɐsɹɐʌǝɔᴉʌ('succeed to get vicevarsa'),                 # 4
    'ɐsɹɐʌǝɔᴉʌ ʇǝɓ oʇ pǝǝɔɔns', $t;
}

done_testing;


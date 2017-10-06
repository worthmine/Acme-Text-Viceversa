use strict;
use Test::More 0.98 tests => 6;

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

    use_ok 'Acme::Text::ɐsɹǝʌǝɔᴉΛ';                                     # 1
    my $v = new_ok('Acme::Text::ɐsɹǝʌǝɔᴉΛ');                            # 2
    my $t = '';
    is $t = $v->ɐsɹǝʌǝɔᴉΛ('text'), 'ʇxǝʇ', "$t ʇǝɓ oʇ pǝǝɔɔns";         # 3
     is $t = $v->ɐsɹǝʌǝɔᴉΛ('succeed to upset Viceversa'),               # 4
    'ɐsɹǝʌǝɔᴉΛ ʇǝsdn oʇ pǝǝɔɔns', $t;
     is $v->ɐsɹǝʌǝɔᴉΛ(<<'END'), <<'END', "succeed to upset multi-lined strings";                        # 5

Copyright (C) Yuki Yoshida.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
END
˙ɟꞁǝsʇᴉ ꞁɹǝԀ sɐ sɯɹǝʇ ǝɯɐs ǝɥʇ ɹǝpun ʇᴉ ʎɟᴉpoɯ ɹo/puɐ ʇᴉ ǝʇnqᴉɹʇsᴉpǝɹ uɐɔ noʎ ⋅̕ǝɹɐʍʇɟos ǝǝɹɟ sᴉ ʎɹɐɹqᴉꞁ sᴉɥ⊥

˙ɐpᴉɥso⅄ ᴉʞn⅄ (Ↄ) ʇɥɓᴉɹʎdoↃ
END
     is $t = $v->ɐsɹǝʌǝɔᴉΛ('sɓuᴉɹʇs ʇǝsdn ʇǝsdn-ǝɹ oʇ pǝǝɔɔns'),                 # 6
    'succeed to re-upset upset strings', $t;
}

done_testing;


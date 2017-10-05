use strict;
use Test::More 0.98 tests => 5;

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
    is $t = $v->ɐsɹǝʌǝsᴉΛ('text'), 'ʇxǝʇ', "$t ʇǝɓ oʇ pǝǝɔɔns";         # 3
     is $t = $v->ɐsɹǝʌǝsᴉΛ('succeed to get viseversa'),                 # 4
    'ɐsɹǝʌǝsᴉʌ ʇǝɓ oʇ pǝǝɔɔns', $t;
    is $t = $v->ɐsɹǝʌǝsᴉΛ(<<'END'), <<'END', $t;                        # 5

Copyright (C) Yuki Yoshida.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
END
˙ɟꞁǝsʇᴉ ꞁɹǝԀ sɐ sɯɹǝʇ ǝɯɐs ǝɥʇ ɹǝpun ʇᴉ ʎɟᴉpoɯ ɹo/puɐ ʇᴉ ǝʇnqᴉɹʇsᴉpǝɹ uɐɔ noʎ ⋅̕ǝɹɐʍʇɟos ǝǝɹɟ sᴉ ʎɹɐɹqᴉꞁ sᴉɥ⊥

˙ɐpᴉɥso⅄ ᴉʞn⅄ (Ↄ) ʇɥɓᴉɹʎdoↃ
END
}

done_testing;


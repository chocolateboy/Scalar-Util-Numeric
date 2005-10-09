#!perl

use strict;
use warnings;

use Config;
use Test::More tests => 34;

use_ok('Scalar::Util::Numeric', qw(:all));
use_ok('Math::Complex');
use_ok('Math::BigInt');

my $uvmax = Scalar::Util::Numeric::uvmax();
my $uvmax_plus_one = Math::BigInt->new($uvmax)->badd(1)->bstr();
my $inf = $Math::Complex::Inf = $Math::Complex::Inf; # silence warning

is (isnum(0), 1, 'isnum(0) == 1');
is (isnum(1), 1, 'isnum(1) == 1');
is (isnum(-1), 9, 'isnum(-1) == 9');
is (isnum('0.00'), 5, "isnum('0.00') == 5");
is (isnum(undef), 0, "isnum(undef) == 0");
is (isnum('A'), 0, "isnum('A') == 0");
is (isnum('A0'), 0, "isnum('A0') == 0");
is (isnum('0A'), 0, "isnum('0A') == 0");
is (isnum(\&ok), 0, "isnum(\\&ok) == 0");
is (isuv($uvmax), 1, 'isuv($uvmax) == 1');
is (isuv(-1), 1, "isuv(-1) == 1");
is (isbig($uvmax), 0, "isbig(\$uvmax) == 0");
is (isbig($uvmax_plus_one), 1, "isbig(\$uvmax + 1) == 1");
is (isfloat(3.1415927), 1, "isfloat(3.1415927) == 1");
is (isfloat(-3.1415927), 1, "isfloat(-3.1415927) == 1");
is (isfloat(3), 0, "isfloat(3) == 0");
is (isneg(-1), 1, "isneg(-1) == 1");
is (isneg(-3.1415927), 1, "isneg(-3.1415927) == 1");
is (isneg(1), 0, "isneg(1) == 0");
is (isneg(3.1415927), 0, "isneg(3.1415927) == 0");
is (isinf('Inf'), 1, "isinf('Inf') == 1");
is (isinf(3.1415927), 0, "isinf(3.1415927) == 0");
is (isinf($inf), 1, 'isinf($Math::Complex::Inf) == 1');
is (isint(-99), -1, "isint(-99) == -1");
is (isint(0), 1, "isint(0) == 1");
is (isint(3.1415927), 0, "isint(3.1415927) == 0");
is (isint(-3.1415927), 0, "isint(-3.1415927) == 0");
is (isint($uvmax), 1, 'isint($uvmax) == 1');
is (isint($inf), 0, 'isint($Math::Complex::Inf) == 0');

SKIP: {
    skip ('NaN is not supported by this platform', 2) unless($Config{d_isnan});
    is (isnan('NaN'), 1, "isnan('NaN') == 1");
    is (isnan(42), 0, "isnan(42) == 0");
}

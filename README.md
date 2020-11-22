# Scalar::Util::Numeric

[![Build Status](https://travis-ci.org/chocolateboy/Scalar-Util-Numeric.svg)](https://travis-ci.org/chocolateboy/Scalar-Util-Numeric)
[![CPAN Version](https://badge.fury.io/pl/Scalar-Util-Numeric.svg)](https://badge.fury.io/pl/Scalar-Util-Numeric)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [NAME](#name)
- [SYNOPSIS](#synopsis)
- [DESCRIPTION](#description)
- [TAGS](#tags)
- [EXPORTS](#exports)
  - [isnum](#isnum)
  - [isint](#isint)
  - [isuv](#isuv)
  - [isbig](#isbig)
  - [isfloat](#isfloat)
  - [isneg](#isneg)
  - [isinf](#isinf)
  - [isnan](#isnan)
  - [uvmax](#uvmax)
- [VERSION](#version)
- [SEE ALSO](#see-also)
- [AUTHORS](#authors)
- [COPYRIGHT AND LICENSE](#copyright-and-license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# NAME

Scalar::Util::Numeric - numeric tests for perl scalars

# SYNOPSIS

```perl
use Scalar::Util::Numeric qw(isnum isint isfloat);

foo($bar / 2) if (isnum $bar);

if (isint $baz) {
    # ...
} elsif (isfloat $baz) {
    # ...
}
```

# DESCRIPTION

This module exports a number of wrappers around perl's builtin `grok_number` function, which
returns the numeric type of its argument, or 0 if it isn't numeric.

# TAGS

All of the functions exported by Scalar::Util::Numeric can be imported by using the `:all` tag:

    use Scalar::Util::Numeric qw(:all);

# EXPORTS

## isnum

```perl
isnum ($val)
```

Returns a nonzero value (indicating the numeric type) if $val is a number.

The numeric type is a conjunction of the following flags:

    0x01  IS_NUMBER_IN_UV               (number within UV range - not necessarily an integer)
    0x02  IS_NUMBER_GREATER_THAN_UV_MAX (number is greater than UV_MAX)
    0x04  IS_NUMBER_NOT_INT             (saw . or E notation)
    0x08  IS_NUMBER_NEG                 (leading minus sign)
    0x10  IS_NUMBER_INFINITY            (Infinity)
    0x20  IS_NUMBER_NAN                 (NaN - not a number)

## isint

## isuv

## isbig

## isfloat

## isneg

## isinf

## isnan

The following flavours of `isnum` (corresponding to the flags above) are also available:

    isint
    isuv
    isbig
    isfloat
    isneg
    isinf
    isnan

`isint` returns -1 if its operand is a negative integer, 1 if
it's 0 or a positive integer, and 0 otherwise.

The others always return 1 or 0.

## uvmax

Returns `UV_MAX`, the largest `UV` (unsigned integer value).

# VERSION

0.40

# SEE ALSO

* ["type" in autobox](https://metacpan.org/pod/autobox#type)
* [Data::Types](https://metacpan.org/pod/Data::Types)
* [Params::Classify](https://metacpan.org/pod/Params::Classify)
* [Params::Util](https://metacpan.org/pod/Params::Util)
* [Scalar::Util](https://metacpan.org/pod/Scalar::Util)
* [String::Numeric](https://metacpan.org/pod/String::Numeric)

# AUTHORS

* [chocolateboy](mailto:chocolate@cpan.org)
* [Michael G. Schwern](mailto:schwern@pobox.com)

# COPYRIGHT AND LICENSE

Copyright © 2003-2020 by chocolateboy.

This is free software; you can redistribute it and/or modify it under the terms of the
[Artistic License 2.0](https://www.opensource.org/licenses/artistic-license-2.0.php).

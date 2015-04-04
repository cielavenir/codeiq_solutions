#!/usr/bin/perl
use strict;
use warnings;
use bignum;
use feature qw(say);
use Math::Prime::Util;
use List::Util;

sub solve{
	return int ((List::Util::reduce {$a*(2*$b->[1]+1)} 1,@_)+1)/2;
}
say solve Math::Prime::Util::factor_exp 24;
say solve Math::Prime::Util::factor_exp 720;
say solve Math::Prime::Util::factor_exp 30414093201713378043612608166064768844377641568960512000000000000;

# perl -M5.010 -Mbignum -MMath::Prime::Util -MList::Util -e'say int ((List::Util::reduce {$a*(2*$b->[1]+1)} 1,Math::Prime::Util::factor_exp 30414093201713378043612608166064768844377641568960512000000000000)+1)/2'
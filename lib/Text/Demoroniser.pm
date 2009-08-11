package Text::Demoroniser;

use strict;
use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS );
use Encode::ZapCP1252;

BEGIN {
	require Exporter;
	$VERSION = '0.01';
	@ISA = qw( Exporter );
	@EXPORT = qw();
	%EXPORT_TAGS = (
		'all' => [ qw( demoroniser demoroniser_utf8 ) ]
	);
	@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
}

sub demoroniser {
	my $str	= shift;
    return  unless(defined $str);

	$str =~ s/\xE2\x80\x9A/,/g;		# 82 - SINGLE LOW-9 QUOTATION MARK
	$str =~ s/\xE2\x80\x9E/,,/g;	# 84 - DOUBLE LOW-9 QUOTATION MARK
	$str =~ s/\xE2\x80\xA6/.../g;	# 85 - HORIZONTAL ELLIPSIS

	$str =~ s/\xCB\x86/^/g;			# 88 - MODIFIER LETTER CIRCUMFLEX ACCENT

	$str =~ s/\xE2\x80\x98/`/g;		# 91 - LEFT SINGLE QUOTATION MARK
	$str =~ s/\xE2\x80\x99/'/g;		# 92 - RIGHT SINGLE QUOTATION MARK
	$str =~ s/\xE2\x80\x9C/"/g;		# 93 - LEFT DOUBLE QUOTATION MARK
	$str =~ s/\xE2\x80\x9D/"/g;		# 94 - RIGHT DOUBLE QUOTATION MARK
	$str =~ s/\xE2\x80\xA2/*/g;		# 95 - BULLET
	$str =~ s/\xE2\x80\x93/-/g;		# 96 - EN DASH
	$str =~ s/\xE2\x80\x94/-/g;		# 97 - EM DASH

	$str =~ s/\xE2\x80\xB9/</g;		# 8B - SINGLE LEFT-POINTING ANGLE QUOTATION MARK
	$str =~ s/\xE2\x80\xBA/>/g;		# 9B - SINGLE RIGHT-POINTING ANGLE QUOTATION MARK

	zap_cp1252($str);

    return $str;
}

sub demoroniser_utf8 {
	my $str	= shift;
    return  unless(defined $str);

	$str =~ s/\xE2\x80\x9A/\x201A/g;	# 82 - SINGLE LOW-9 QUOTATION MARK
	$str =~ s/\xE2\x80\x9E/\x201E/g;	# 84 - DOUBLE LOW-9 QUOTATION MARK
	$str =~ s/\xE2\x80\xA6/\x2026/g;	# 85 - HORIZONTAL ELLIPSIS

	$str =~ s/\xCB\x86/\x02C6/g;		# 88 - MODIFIER LETTER CIRCUMFLEX ACCENT

	$str =~ s/\xE2\x80\x98/\x2018/g;	# 91 - LEFT SINGLE QUOTATION MARK
	$str =~ s/\xE2\x80\x99/\x2019/g;	# 92 - RIGHT SINGLE QUOTATION MARK
	$str =~ s/\xE2\x80\x9C/\x201C/g;	# 93 - LEFT DOUBLE QUOTATION MARK
	$str =~ s/\xE2\x80\x9D/\x201D/g;	# 94 - RIGHT DOUBLE QUOTATION MARK
	$str =~ s/\xE2\x80\xA2/\x2022/g;	# 95 - BULLET
	$str =~ s/\xE2\x80\x93/\x2013/g;	# 96 - EN DASH
	$str =~ s/\xE2\x80\x94/\x2014/g;	# 97 - EM DASH

	$str =~ s/\xE2\x80\xB9/\x2039/g;	# 8B - SINGLE LEFT-POINTING ANGLE QUOTATION MARK
	$str =~ s/\xE2\x80\xBA/\x203A/g;	# 9B - SINGLE RIGHT-POINTING ANGLE QUOTATION MARK

	fix_cp1252($str);

    return $str;
}

1;
__END__

=pod

=head1 NAME

Text::Demoroniser - A text filter that allows you to demoronise a string.

=head1 SYNOPSIS

  use Text::Demoroniser qw(demoroniser);

  my $bad  = 'string with smart characters in'
  my $good = demoroniser($bad);

=head1 DESCRIPTION

A text filter that allows you to replace inappropriate Microsoft characters a 
string with something more suitable.

=head1 API

This module exports following filters:

=head2 demoroniser

Given a string, will replace the Microsoft "smart" characters with sensible
ACSII versions.

=head2 demoroniser_utf8

The same as demoroniser, but converts into correct UTF8 versions.

=head1 SEE ALSO

L<Encode::ZapCP1252>

=head1 AUTHOR

Barbie, E<lt>barbie@missbarbell.co.ukE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Barbie

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.

=cut

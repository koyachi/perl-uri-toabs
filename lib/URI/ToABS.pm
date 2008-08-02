package URI::ToABS;
use warnings;
use strict;
use Carp;
use version; our $VERSION = qv('0.0.2');

use Exporter;
our @ISA = qw/Exporter/;
our @EXPORT = qw/uri_to_abs/;

sub uri_to_abs {
    my($url) = @_;
    return $url unless ($url =~ /^http/);
    
    my @paths = split /\//, $url;
    my @results = ($paths[0]);
    for (my $i = 1; $i < ($#paths+1); $i++) {
        my $current_path = $paths[$i];
        if ($current_path eq '..') {
            pop @results;
            next;
        } elsif ($current_path eq '.') {
            next;
        }
        push @results, $current_path;
    }
    join('/', @results);
}


1; # Magic true value required at end of module
__END__

=head1 NAME

URI::ToABS - convert url has relative paths("..", ".") to absolute path.


=head1 VERSION

This document describes URI::ToABS version 0.0.2


=head1 SYNOPSIS

    use URI::ToABS;
    
    my $url = uri_to_abs('http://example.com/foo/bar/../index.html');  # 'http://example.com/foo/index.html'

=head1 DESCRIPTION

This module convert url that has relative paths to absolute path.

=head1 METHODS

=head2 uri_to_abs
ARG: uri in string
RETURN: converted uri

=head1 AUTHOR

Tsutomu KOYACHI  C<< <rtk2106@gmail.com> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Tsutomu KOYACHI C<< <rtk2106@gmail.com> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

package Crypt::Passphrase::MD5::Hex;

use strict;
use warnings;

use Crypt::Passphrase -validator;

use Digest::MD5 'md5';

sub new {
	my $class = shift;
	return bless {}, $class;
}

sub accepts_hash {
	my ($self, $hash) = @_;
	return $hash =~ / ^ [a-f0-9]{32} $/xi;
}

sub verify_password {
	my ($self, $password, $hash) = @_;
	return md5($password) eq pack('H32', $hash);
}

1;

# ABSTRACT: Validate against hexed MD5 hashes with Crypt::Passphrase

=head1 DESCRIPTION

This module implements a validator for hex-encoded MD5 hashes.

=method new()

This creates a new MD5 validator. It takes no arguments.

=method accepts_hash($hash)

This (heuristically) determines if we may be dealing with a hex encoded md5 sum.

=method verify_hash($password, $hash)

This determines if the password matches the hash when MD5'ed.

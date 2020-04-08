use Test::More;
use strict;
use warnings;
use Net::SAML2;

my $lor = Net::SAML2::Protocol::LogoutResponse->new(
        issuer      => 'http://some/sp',
        destination => 'http://some/idp',
        status      => 'success',
        response_to => 'randomID', 
);
ok($lor);
my $xml = $lor->as_xml;
ok($xml);
#diag($xml);

like($xml, qr/ID=".+"/);
like($xml, qr/IssueInstant=".+"/);

done_testing;

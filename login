#!/usr/bin/perl

use CGI qw/:standard/;
my $query = CGI->new;

#login:admin password:admin

$cookie = $query->cookie(
     -name=>'sessionID',
     -value=>'xyzzy',
     -expires=>'+1m',
     -path=>'/cgi-bin/login',
     -domain=>'127.0.0.1',
     -secure=>1);

print header;
print start_html("Cookie");
if ($cookie) {

print <<EndOfHTML;
<h2>Welcome!</h2>
Your cookie is $cookie.<p>
EndOfHTML

} else {

print <<EndOfHTML;
<h2>Welcome!</h2>
There is no cookie!!<p>
EndOfHTML
}
print end_html;
#print $query->header(-cookie=>$cookie);

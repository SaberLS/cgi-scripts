#!/usr/bin/perl

use CGI qw/:standard/;
my $query = CGI->new;

#login:admin password:admin


$cookie = $query->cookie('MY_COOKIE');

if ($cookie) {
$cookie = $query->cookie(
       -name=>'MY_COOKIE',
			 -value=>'BEST_COOKIE=chocolatechip',
			 -expires=>'+60s',
			 -path=>'/');
print $query->header(-cookie=>$cookie);

print start_html("Cookie");
print <<EndOfHTML;
<h2>Welcome!</h2>
Your cookie is $cookie.<p>
EndOfHTML

} else {
$cookie = $query->cookie(
       -name=>'MY_COOKIE',
			 -value=>'BEST_COOKIE=chocolatechip',
			 -expires=>'+60s',
			 -path=>'/');
print $query->header(-cookie=>$cookie);
print start_html("Cookie");

print <<EndOfHTML;
<h2>Welcome!</h2>
There is no cookie!!<p>
Setting up new cookie!:<p>
$cookie<p>
EndOfHTML
}
print end_html;


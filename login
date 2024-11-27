#!/usr/bin/perl

use CGI qw/:standard/;
my $query = CGI->new;

#login:admin password:admin


$cookie = $query->cookie('SESSION');

if ($cookie) {
my $sid = $cookie;
$cookie = $query->cookie(-name=>'SESSION',
    -value=>$sid,
    -expires=>'+60s',
    -path=>'/',
    -domain=>'127.0.0.1',
    -secure=>1);
print $query->header(-cookie=>$cookie);

print start_html("Cookie");
print <<EndOfHTML;
<h2>Welcome!</h2>
Your session id is $sid.<p>
EndOfHTML

} else {
my $sid = int(rand(1000000));
$cookie = $query->cookie(-name=>'SESSION',
    -value=>$sid,
    -expires=>'+60s',
    -path=>'/',
    -secure=>1);
 print $query->header(-cookie=>$cookie);

start_html("Cookie");
print <<EndHTML;
<form >
Please enter your login name and password.
username: <input type="text" name="username" size=10><br>
password: <input type="password" name="password" size=10><p>
<input type="submit">
</form>
EndHTML
}

print end_html;


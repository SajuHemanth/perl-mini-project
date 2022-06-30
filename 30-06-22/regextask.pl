use strict;
use LWP::UserAgent;

my $ua = new LWP::UserAgent;
my $url='https://store.berniesanders.com/';
my $request = new HTTP::Request('GET', $url);
my $response = $ua->request($request);
my $content = $response->content();

while($content =~ m/Regular price<\/span>\s*(.*)\s*<\/span>/gm)
{
    print("price:$1\n");
}

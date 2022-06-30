use strict;
use LWP::UserAgent;
my $ua = new LWP::UserAgent;
my $url='https://store.berniesanders.com/';
my $request = new HTTP::Request('GET', $url);
my $response = $ua->request($request);
my $content = $response->content();

while( $content =~ m/<div[^>]*?([^>]*?)\"[^>]*?>\s*([\w\W]*?)\s*<\/div>/igs )
{  
     
    while($2=~ m/<a href=\"([^>]*?)\"[^>]*?>\s*([\w\W]*?)\s*<\/a>/igs)
    {
        if($2=~ m/img/)
        {
            # print("match");
        }
        else
        {
                   print("Products:$2\n");
                
        }
    
    }

}
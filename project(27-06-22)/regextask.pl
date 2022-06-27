# # local $/ = '';
# # my $a = <DATA>;

# # while( $a =~ m/<a[^>]*?href=\"([^>]*?)\"[^>]*?>\s*([\w\W]*?)\s*<\/a>/igs )
# # {   
# #     print "Link:$1 \n Text: $2\n";
# # }

# # __DATA__
# # <div>
# # <a href="https://store.berniesanders.com">Berniesanders</a>
# # </div>


# use warnings;
# use strict;
# use LWP::UserAgent;

# my $ua = LWP::UserAgent->new;
# my $url = 'https://store.berniesanders.com';

# # The name of the file input field on the HTML form/
# # You'll need to change this to whatever the correct name is.
# my $file_input = 'ht.html';

# # Path to the local file that you want to upload
# my $file_path = './ht.html';

# my $req = $ua->get($url,
#   Content_Type => 'form-data',
#   Content => [
#      $file_input => [ $file_path ],
#   ],

# );
# # print $req;



# -*- coding: utf-8 -*-
# perl

# get web page content

use strict;
use LWP::UserAgent;

my $ua = new LWP::UserAgent;
$ua->timeout(120);
my $url='https://store.berniesanders.com/';
my $request = new HTTP::Request('GET', $url);
my $response = $ua->request($request);
my $content = $response->content();
my $final="";
while( $content =~ m/<div[^>]*?([^>]*?)\"[^>]*?>\s*([\w\W]*?)\s*<\/div>/igs )
{   
    while($2=~ m/<a[^>]*?href=\"([^>]*?)\"[^>]*?>\s*([\w\W]*?)\s*<\/a>/igs)
    {
        print("Text:$2\n");
    }

}
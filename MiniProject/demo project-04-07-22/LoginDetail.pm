package LoginDetail;
use strict;
use warnings;
use lib "/home/asplap1195/Desktop/Demoproject";
use Validations;

sub login_user
{
#username 
    print ("**welcome to login page**\n");
    print ("please enter the below details:\n");
    my $UserName;
      my $std=1;
      while($std == 1) {
         print "UserName:";
         $UserName = <STDIN>;
         chomp($UserName);
         my $validate_name=Validations->validate_name($UserName);
         if($validate_name eq 'true') {
            $std=0;
            }
         }   

#password
    my $password;
    my $std=1;
    while($std == 1) {
        print "password:";
        $password = <STDIN>;
        chomp($password);
        my $validate_password=Validations->validate_password($password);
         if($validate_password eq 'true') {
            $std=0;
            }
    }
}
1;
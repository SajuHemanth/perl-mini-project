use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;
use LoginDetail;
use Validations;
print "->Welcome To Foresight Airlines<-\n";
print "********************************\n";
my $input;
my $std=1;
while($std==1) {
    print ("\nFurther Details Regarding Foresight Airlines are provided as follows:\n");
    print ("-----------------------------------------------------------------------\n");
    print ("please choose any of the following options: \n");
    print ("1.Login Details \n");
    print ("2.New Registration \n");
    print ("3.Steps \n");
    print ("4.User Manual \n");
    print ("5.Availability chart \n");
    print ("6.Booking Page \n");
    print ("7.View Details \n");
    print ("8.Cancellation policy \n");
    print ("9.History of booking \n");
    print ("10.Exit Page \n");
    print("Enter any key:");
    my $input =<STDIN>;
    #my $std=1;
    
    if ($input =~ /^[1-10]$/) {
if($input == 1)
{
   LoginDetail->login_user();
   
}
 
elsif($input == 2)
{
    LoginDetail->user_details();
    
}
 
elsif($input == 3)
{
    LoginDetail->steps();
    $std=0;
}
 
else
{
    printf "Enter the Correct Key:\n";
}
}
    }

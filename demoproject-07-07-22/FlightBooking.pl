use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;
use LoginDetail;
use Validations;
use DbConnection;
my $connection= $DbConnection::dataConnection;
print "->Welcome To Foresight Airlines<-\n";
print "-----------------------------------\n";
my $input;
my $std=1;
while($std==1) {
    print ("\nFurther Details Regarding Foresight Airlines are provided as follows:\n");
    print ("-----------------------------------------------------------------------\n");
    print ("please choose any of the following options: \n");
    print ("1.Login Details \n");
    print ("2.New Registration \n");
    print ("3.User Manual \n");
    print ("4.Availability chart \n");
    print ("5.Booking Page \n");
    print ("6.View Details \n");
    print ("7.Cancellation policy \n");
    print ("8.History of booking \n");
    print ("9.Exit Page \n");
    print("Enter any key:");
    my $input =<STDIN>;
    if ($input =~ /\d+/) {
        if($input == 1)
        {
            LoginDetail->login_user();
            LoginDetail->menu();
            #print my $menu->get_menu;
        }
        elsif($input == 2)
        {
            LoginDetail->user_detail();
            LoginDetail->menu();
        }
        elsif($input == 3) 
        {
            LoginDetail->user_manual();
            LoginDetail->menu();
        }
        elsif($input == 4)
        {
            LoginDetail->availability_chart();
            LoginDetail->menu();
        }
        elsif($input == 5)
        {
            LoginDetail->booking_page();
            LoginDetail->menu();
        }
        elsif($input == 6)
        {
            LoginDetail->view_details();
            LoginDetail->menu();
        }
        elsif($input == 7)
        {
            LoginDetail->cancellation_policy();
            LoginDetail->menu();
        }
        elsif($input == 8)
        {
            LoginDetail->booking_history();
            LoginDetail->menu();
        }
        elsif($input == 9)
        {
            LoginDetail->exitpage();
            $std=0;
        }
        else
        {
            printf "Enter the Correct Key:\n";
        }
    }
}

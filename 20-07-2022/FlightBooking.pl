use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;
use LoginDetail;
use Validations;
use DbConnection;
my $connection= $DbConnection::dataConnection;
print "->Welcome To Foresight Airlines<-\n";
print "-----------------------------------\n";
my $login_user = LoginDetail->new;
my $input;
my $std=1;
while($std==1) {
    print ("\nFurther Details Regarding Foresight Airlines are provided as follows:\n");
    print ("-----------------------------------------------------------------------\n");
    print ("please choose any of the following options: \n");
    print ("1.New Registration \n");
    print ("2.Saved User Detail \n");
    print ("3.User Manual \n");
    print ("4.Availability chart \n");
    print ("5.Booking Page \n");
    print ("6.View Details \n");
    print ("7.Cancellation policy \n");
    print ("8.Exit Page \n");
    print ("Enter any key:");
    my $input =<STDIN>;
    if ($input =~ /\d+/) {
        if($input == 1) {
          my $detail = LoginDetail->user_detail;
          my $User_menu = LoginDetail->menu;
        }
        elsif($input == 2) {
          my $details = LoginDetail->User_Register_Details;
          my $User_menu = LoginDetail->menu;
        }
        elsif($input == 3) {
          my $User_manual = LoginDetail->user_manual;
          my $User_menu = LoginDetail->menu;
        }
        elsif($input == 4) {
          my $Availability = LoginDetail->availability_chart;
          my $User_menu = LoginDetail->menu;
        }
        elsif($input == 5) {
          my $Booking = LoginDetail->booking_page;
          my $User_menu = LoginDetail->menu;
        }
        elsif($input == 6) {
          my $Viewdetails = LoginDetail->view_details;
          my $User_menu = LoginDetail->menu;
        }
        elsif($input == 7) {
          my $Cancellation = LoginDetail->cancellation_policy;
          my $User_menu = LoginDetail->menu;
        }
        elsif($input == 8) {
          my $exit= LoginDetail->exitpage;
          $std=0;
        }
        else
        {
          printf "Enter the Correct Key:\n";
        }
     }
}

# package Menu;
# use strict;
# use warnings;
# use LoginValidations;
# use Cancellation;
# use Menu;
# # use ViewDetail;
# use BookingPage;
# use RegisterationValidation;
# use AvailabilityChart;
# use LoginDetail;
# use Validations;
# use DbConnection;
# my $connection= $DbConnection::dataConnection;
# sub menu
# {
#    menu:
#    my $std=1;
#    while($std==1) {
#       print ($ErrorConfiguration::error_print{7});
#       my $option =<STDIN>;
#       chomp($option);
#       if($option =~ m{[12]}) {
#          if($option == 2) {
#             print($ErrorConfiguration::error_print{8});
#             exit();
#          }
#          else {
#             $std=0;
#          }
#       }
#       else {
#           warn ($ErrorConfiguration::error_print{8});
#       }
#    }
# }

# sub menu_bar
# {
#    menu_bar:
#    my $std=1;
#    while($std==1) {
#     print ("\nFurther Details Regarding Foresight Airlines are provided as follows:\n");
#     print ("-----------------------------------------------------------------------\n");
#     print ("please choose any of the following options: \n");
#     print ("1.User Manual \n");
#     print ("2.Availability chart \n");
#     print ("3.Booking Page \n");
#     print ("4.View Details \n");
#     print ("5.Cancellation policy \n");
#     print ("6.Exit Page \n");
#     print ("Enter any key:");
#     my $input =<STDIN>;
#     if ($input =~ /\d+/) {
#       if($input == 1) {
#           my $User_manual = LoginDetail->user_manual;
#           my $User_menu = LoginDetail->menu;
#         }
#         elsif($input == 2) {
#           my $Availability = LoginDetail->availability_chart;
#           my $User_menu = LoginDetail->menu;
#         }
#         elsif($input == 3) {
#           my $Availability = LoginDetail->availability_chart;
#           my $Booking = LoginDetail->booking_page;
#           my $User_menu = LoginDetail->menu;
#         }
#         elsif($input == 4) {
#           my $Viewdetails = LoginDetail->view_details;
#           my $User_menu = LoginDetail->menu;
#         }
#         elsif($input == 5) {
#           my $Cancellation = LoginDetail->cancellation_policy;
#           my $User_menu = LoginDetail->menu;
#         }
#         elsif($input == 6) {
#           my $exit= LoginDetail->exitpage;
#           $std=0;
#         }
#         else
#         {
#           printf "Enter the Correct Key:\n";
#         }
# }
# }
# }
# 1;
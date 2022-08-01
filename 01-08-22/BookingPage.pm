# package BookingPage;
# use strict;
# use warnings;
# use LoginValidations;
# use Cancellation;
# use Menu;
# use ViewDetail;
# use BookingPage;
# use RegisterationValidation;
# use AvailabilityChart;
# use LoginDetail;
# use Validations;
# use DbConnection;
# my $connection= $DbConnection::dataConnection;
# sub booking_page
# {    
#       booking:
#       my ($flight_name;$boarding;$destination;$Arrivaltime;$DepatureTime;$available_seats;$Fare;$flight_type;$flight_id;$row;
#       $UserId;$Usermenu);
#       print ("Enter the Boarding point:");
#       $boarding=<STDIN>;
#       chomp($boarding);
#       print ("\nEnter the Destination point:");
#       $destination=<STDIN>;
#       chomp($destination);
#       my $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{6});
#       my $result = $query->execute($boarding,$destination);
#       if($result ==0) {
#          warn "There is no data to display";
#          $Usermenu = $self->menu; 
#       }
#       else {
#          while(my @row = $query->fetchrow_array()) {
#          $flight_name=$row[0];
#          $boarding=$row[1];
#          $destination=$row[2];
#          $Arrivaltime=$row[3];
#          $DepatureTime=$row[4];
#          $available_seats=$row[5];
#          $Fare=$row[6];
#          $flight_type=$row[7];
#          $flight_id=$row[8];
#          print("\nFlightName  :$flight_name\n");
#          print("Boarding      :$boarding\n");
#          print("Destination   :$destination\n");
#          print("ArrivalTime   :$Arrivaltime\n");
#          print("DepatureTime  :$DepatureTime\n");
#          print("AvailableSeats:$available_seats\n");
#          print("Fare          :$Fare\n");
#          print("FlightType    :$flight_type\n");
#          print("FlightId      :$flight_id\n");
#          print"please check the details and confirm your booking\n";        
#          }
#          my $std=1;
#          while($std==1)
#          {
#             print("Enter the Flight ID:");
#             my $flightBooking=<STDIN>;
#             chomp($flightBooking);
#             $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{7});
#             $result = $query->execute($flightBooking,$boarding,$destination);
#             if($result ==0) {
#                warn "There is no data to display";
#             }
#             else {
#                while(my @row = $query->fetchrow_array()) {
#                   $flight_name=$row[0];
#                   $boarding=$row[1];
#                   $destination=$row[2];
#                   $Arrivaltime=$row[3];
#                   $DepatureTime=$row[4];
#                   $available_seats=$row[5];
#                   $Fare=$row[6];
#                   $flight_type=$row[7];
#                   $flight_id=$row[8];
#                   print("\nFlightName    :$flight_name\n");
#                   print("Boarding      :$boarding\n");
#                   print("Destination   :$destination\n");
#                   print("ArrivalTime   :$Arrivaltime\n");
#                   print("DepatureTime  :$DepatureTime\n");
#                   print("AvailableSeats:$available_seats\n");
#                   print("Fare          :$Fare\n");
#                   print("FlightType    :$flight_type\n");
#                   print("FlightId      :$flight_id\n");
#                   print"please check the details and confirm your booking\n";        
#                }
#                selection:
#                print "Confirm this flight(1.yes/2.no)";
#                my $selection=<STDIN>;
#                chomp($selection);
#                if($selection =~ m{[12]}) {
#                   if($selection == 1) {
#                      print("Enter Number of Seats:");
#                      my $seats=<STDIN>;
#                      $DbConnection::dataConnection->do($ErrorConfiguration::error_query{8},undef,$loggedinuserid,$flightBooking,$seats);
#                      print("your ticket is booked successfully\n");
#                   }
#                   else {
#                      goto booking;
#                   }
#                }
#                else {
#                   goto selection;
#                }
#                $std=0;
#             }
#          }
#       }
# }
# 1;
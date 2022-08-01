# package ViewDetail;
# use strict;
# use warnings;
# use LoginValidations;
# use Cancellation;
# use Menu;
# use ViewDetail;
# use BookingPage;
# use RegisterationValidation;
# use Availabilitychart;
# use LoginDetail;
# use Validations;
# use DbConnection;
# my $connection= $DbConnection::dataConnection;
# my $loggedinuserid;
# sub view_details
# {  
#    my $UserId;
#    my $FirstName;
#    my ($LastName,$flight_id,$boarding,$destination,$Depaturetime,$Arrivaltime,$Fare,$booked_seats,$total_fare);
#    print("\nplease find the details of booked flight\n");
#    my $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{9});
#    my $result = $query->execute($loggedinuserid);
#    if($result ==0) {
#       warn "There is no data to display";
#    }
#    else {
#       while(my @row = $query->fetchrow_array()) {
#          $UserId=$row[0];$FirstName=$row[1];$LastName=$row[2];$flight_id=$row[3];$boarding=$row[4];$destination=$row[5];
#          $Depaturetime=$row[6];$Arrivaltime=$row[7];$Fare=$row[8];$booked_seats=$row[9];$total_fare=$row[10];
#          print("\nUserId     :$UserId\n");
#          print("FirstName    :$FirstName\n");
#          print("LastName     :$LastName\n");
#          print("FlightId     :$flight_id\n");
#          print("BoardingPoint:$boarding\n");
#          print("Destination  :$destination\n");
#          print("DepatureTime :$Depaturetime\n");
#          print("ArrivalTime  :$Arrivaltime\n");
#          print("Fare         :$Fare\n");
#          print("BookedSeats  :$booked_seats\n");
#          print("TotalFare    :$total_fare\n");
#       }
#    } 
# }
# 1;
package LoginDetail;
use strict;
use warnings;
use lib "/home/asplap1195/Desktop/Demoproject";
use Validations;
use DbConnection;
my $connection= $DbConnection::dataConnection;
my $loggedinuserid;

sub new
{
#EmailID Details
      print ("**Welcome to Login Page**\n");
      print ("Please Fill The Below Fields\n");
      my $class = shift;
      my $email_id =shift;
      my $std=1;
      while($std == 1) {
         print "\nMail ID:";
         $email_id=<STDIN>;
         chomp($email_id);
         my $validate_email=Validations->validate_email($email_id);
         if($validate_email eq 'true') {
            my $query = $DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{1});
            my $result = $query->execute("$email_id");
            if($result ==0) {
               print ("$ErrorConfiguration::error_message{1}\n");
               my $detail = LoginDetail->user_detail;
               $std=0;
            }
            else {
               $class = shift;
               my $password =shift;
               $std=1;
               while($std == 1) {
                  print "Password :";  
                  system ("stty -echo");  
                  $password = <STDIN>;
                  chomp $password;  
                  system ("stty echo");
                  my $validate_password=Validations->validate_password($password);
                  if($validate_password eq 'true') {
                  my $query = $DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{2});
                  my $result = $query->execute("$email_id");
                  while(my @row = $query->fetchrow_array()) {
                     $loggedinuserid=$row[5]
                  }
                  $std=0;  
                  }
               }     
            }
         } 
      }
}

sub user_detail
{  
#FirstName
      print ("***welcome to Registeration***\n");
      my $class = shift;
      my $FirstName =shift;
      my $std=1;
      while($std == 1) {
         print "FirstName:";
         $FirstName = <STDIN>;
         chomp($FirstName);
         my $validate_name=Validations->validate_name($FirstName);
         if($validate_name eq 'true') {
            $std=0;
         }
      } 

#LastName
      my $LastName =shift;
      $std=1;
      while($std == 1) {
         print "LastName:";
         $LastName = <STDIN>;
         chomp($LastName);
         my $validate_name=Validations->validate_name($LastName);
         if($validate_name eq 'true') {
            $std=0;
         }
      } 
          

#Phonenumber Details
      my $phone_no =shift;
      $std=1;
      while($std == 1) {
         print "Enter the Phonenumber:";
         $phone_no=<STDIN>;
         chomp($phone_no);
         my $validate_phoneNumber=Validations->validate_phoneNumber($phone_no);
         if($validate_phoneNumber eq 'true') {
            $std=0;
         }
      }

#Gender Details
      my $gender =shift;
      $std=1;
      while($std == 1) {
         print "Enter the gender(M/F/T):";
         $gender=<STDIN>;
         chomp($gender);
         my $validate_gender=Validations->validate_gender($gender);
         if($validate_gender eq 'true') {
            $gender=uc($gender);
            $std=0;
         }
      }

#EmailID Details
      my $email_id =shift;
      $std=1;
      while($std == 1) {
         print "Mail ID:";
         $email_id=<STDIN>;
         chomp($email_id);
         my $validate_email=Validations->validate_email($email_id);
         if($validate_email eq 'true') {
            $std=0;
         }
      }

#UserId detail
      my $UserId;
      $std=1;
      while($std == 1) {
         print "UserId(FSAXXX):";
         $UserId=<STDIN>;
         chomp($UserId);
         my $Validate_Userid=Validations->Validate_Userid($UserId);
         if($Validate_Userid eq 'true') {
            $loggedinuserid=$UserId;
            $std=0;
         }
      }
      $DbConnection::dataConnection->do($ErrorConfiguration::error_query{3},undef,$FirstName,$LastName,$gender,$email_id,$phone_no,$UserId);
      print("The New registeration is done successfully!!!\n");
}  


sub user_manual
{ 
   user_manual:
   my $filename = "/home/asplap1195/Documents/UserManual.txt";
   open(FH, '<', $filename) or die "Could not open file '$filename' $!";
   while(<FH>){
      print $_;
   }
      close(FH);
}


sub User_Register_Details
{ 
   User_Register_Details:
   my $firstname;
   my $lastname;
   my $Phonenumber;
   my $gender;
   my $MailId;
   my $user_id;
   my $bulkdata;
   $bulkdata=<STDIN>;
   chomp($bulkdata);
   my @details = split(' ', $bulkdata);
   $firstname = $details[0];
   $lastname = $details[1];
   $gender = $details[2];
   $MailId = $details[3];
   $Phonenumber = $details[4];
   $user_id = $details[5];
   print("Firstname:$firstname\nLastName:$lastname\nGender:$gender\nMailID:$MailId\nPhoneNumber:$Phonenumber\nUserID:$user_id\n");
   $DbConnection::dataConnection->do($ErrorConfiguration::error_query{4},undef,$firstname,$lastname,$gender,$MailId,$Phonenumber,$user_id);
}

sub availability_chart
{
   print ("The Flights Availability are displayed below:\n");
   print ("----------------------------------------------\n");
   my $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{5});
   my $result = $query->execute();
   if($result ==0) {
      warn "There is no data to display"
   }
   else {
      while(my @row = $query->fetchrow_array()) {
         print "@row\n\n";
      }
   }
}

sub booking_page
{    
      booking:
      my $flight_name;my $boarding;my $destination;my $Arrivaltime;my $DepatureTime;my $available_seats;my $Fare;my $flight_type;my $flight_id;my $row;
      my $UserId;   my $Usermenu;
      print ("Enter the Boarding point:");
      $boarding=<STDIN>;
      chomp($boarding);
      print ("\nEnter the Destination point:");
      $destination=<STDIN>;
      chomp($destination);
      my $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{6});
      my $result = $query->execute($boarding,$destination);
      if($result ==0) {
         warn "There is no data to display";
         $Usermenu = LoginDetail->menu;
      }
      else {
         while(my @row = $query->fetchrow_array()) {
         $flight_name=$row[0];
         $boarding=$row[1];
         $destination=$row[2];
         $Arrivaltime=$row[3];
         $DepatureTime=$row[4];
         $available_seats=$row[5];
         $Fare=$row[6];
         $flight_type=$row[7];
         $flight_id=$row[8];
         print("\nFlightName  :$flight_name\n");
         print("Boarding      :$boarding\n");
         print("Destination   :$destination\n");
         print("ArrivalTime   :$Arrivaltime\n");
         print("DepatureTime  :$DepatureTime\n");
         print("AvailableSeats:$available_seats\n");
         print("Fare          :$Fare\n");
         print("FlightType    :$flight_type\n");
         print("FlightId      :$flight_id\n");
         print"please check the details and confirm your booking\n";        
         }
         my $std=1;
         while($std==1)
         {
            print("Enter the Flight ID:");
            my $flightBooking=<STDIN>;
            chomp($flightBooking);
            $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{7});
            $result = $query->execute($flightBooking,$boarding,$destination);
            if($result ==0) {
               warn "There is no data to display";
            }
            else {
               while(my @row = $query->fetchrow_array()) {
                  $flight_name=$row[0];
                  $boarding=$row[1];
                  $destination=$row[2];
                  $Arrivaltime=$row[3];
                  $DepatureTime=$row[4];
                  $available_seats=$row[5];
                  $Fare=$row[6];
                  $flight_type=$row[7];
                  $flight_id=$row[8];
                  print("\nFlightName    :$flight_name\n");
                  print("Boarding      :$boarding\n");
                  print("Destination   :$destination\n");
                  print("ArrivalTime   :$Arrivaltime\n");
                  print("DepatureTime  :$DepatureTime\n");
                  print("AvailableSeats:$available_seats\n");
                  print("Fare          :$Fare\n");
                  print("FlightType    :$flight_type\n");
                  print("FlightId      :$flight_id\n");
                  print"please check the details and confirm your booking\n";        
               }
               selection:
               print "Confirm this flight(1.yes/2.no)";
               my $selection=<STDIN>;
               chomp($selection);
               if($selection =~ m{[12]}) {
                  if($selection == 1) {
                     print("Enter Number of Seats:");
                     my $seats=<STDIN>;
                     $DbConnection::dataConnection->do($ErrorConfiguration::error_query{8},undef,$loggedinuserid,$flightBooking,$seats);
                     print("your ticket is booked successfully\n");
                  }
                  else {
                     goto booking;
                  }
               }
               else {
                  goto selection;
               }
               $std=0;
            }
         }
      }
}


sub view_details
{  
   
   my $UserId;my $FirstName;my $LastName;my $flight_id;my $boarding;my $destination;my $Depaturetime;my $Arrivaltime;my $Fare;my $booked_seats; my $total_fare;
   print("\nplease find the details of booked flight\n");
   my $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{9});
   my $result = $query->execute($loggedinuserid);
   if($result ==0) {
      warn "There is no data to display";
   }
   else {
      while(my @row = $query->fetchrow_array()) {
         $UserId=$row[0];$FirstName=$row[1];$LastName=$row[2];$flight_id=$row[3];$boarding=$row[4];$destination=$row[5];
         $Depaturetime=$row[6];$Arrivaltime=$row[7];$Fare=$row[8];$booked_seats=$row[9];$total_fare=$row[10];
         print("\nUserId     :$UserId\n");
         print("FirstName    :$FirstName\n");
         print("LastName     :$LastName\n");
         print("FlightId     :$flight_id\n");
         print("BoardingPoint:$boarding\n");
         print("Destination  :$destination\n");
         print("DepatureTime :$Depaturetime\n");
         print("ArrivalTime  :$Arrivaltime\n");
         print("Fare         :$Fare\n");
         print("BookedSeats  :$booked_seats\n");
         print("TotalFare    :$total_fare\n");
      }
   } 
}

sub cancellation_policy
{ 
  print ("Cancellation page:\n");
  print ("--------------------\n");
  print ("Choose the valid reason for cancellation:\n");
  my $reason1 ="\n1.Medical Emergency";
  my $reason2 ="2.Travelling plan changed";
  my $reason3 ="3.Missed Flight";
  my $reason4 ="4.Other Reasons";
  print ("$reason1\n");
  print ("$reason2\n");
  print ("$reason3\n");
  print ("$reason4\n");
  print ("\nplease select the reasons for cancellation(1/2/3/4):");
  my $detail=<STDIN>;
  chomp($detail);
   if($detail== 1) {
      print ("$reason1\n");
      print ("Your Request has been Accepted further details regarding cancellation will be updated shortly\n");
   }
   elsif($detail== 2) {
      print ("$reason2\n");
      print ("Your Request has been Accepted further details regarding cancellation will be updated shortly\n");
   }
   elsif($detail== 3) {
      print ("$reason3\n");
      print ("Your Request has been Accepted further details regarding cancellation will be updated shortly\n");
   }
   elsif($detail== 4) {
      print("$reason4\n");
      print ("Your Request has been Accepted further details regarding cancellation will be updated shortly\n");

   }
   else {
      warn "Please enter the valid reason\n";
   }
}


sub menu
{
   menu:
   my $std=1;
   while($std==1) {
      print ("Proceed with further Details:(1.yes/2.no):");
      my $option =<STDIN>;
      chomp($option);
      if($option =~ m{[12]}) {
         if($option == 2) {
            print("Details are Registered...Thank you\n");
            exit();
         }
         else {
            $std=0;
         }
      }
      else {
          warn "Choice Invalid\n"
      }
   }
}


sub exitpage
{
   print "Thanks for reserving your flight ticket with us\n";
   print "We Wish you a pleasant flight with us:)\n";
}

1;


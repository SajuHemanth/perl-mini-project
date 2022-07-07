package LoginDetail;
use strict;
use warnings;
use lib "/home/asplap1195/Desktop/Demoproject";
use Validations;
use DbConnection;
my $connection= $DbConnection::dataConnection;

sub login_user
{
#username
      #my $menu = LoginDetail->login_user;
      print ("**Welcome to Login Page**\n");
      print ("Please Fill The Below Fields\n");
      my $class = shift;
      my $UserName = shift;
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
    my $password =shift;
    $std=1;
    while($std == 1) {
        print "password:";
        $password = <STDIN>;
        chomp($password);
        my $validate_password=Validations->validate_password($password);
         if($validate_password eq 'true') {
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
}

sub user_detail
{  
#FirstName
      print ("***welcome to Registeration***\n");
      my $class = shift;
      my $FirstName;
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
      $DbConnection::dataConnection->do('INSERT INTO UserDetails(FirstName,LastName,Gender,EmailId,PhoneNumber) VALUES(?,?,?,?,?)',
      undef,$FirstName,$LastName,$gender,$email_id,$phone_no);
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
# $DbConnection::dataConnection->do('INSERT INTO UserDetails(FirstName,LastName,Gender,EmailId,PhoneNumber) VALUES(?,?,?,?,?)',
#       undef,$FirstName,$LastName,$gender,$email_id,$phone_no);
}

sub availability_chart
{

   print ("The Flights Availability are displayed here:\n");
   print ("--------------------------------------------\n");
   my $std=1;
   while($std ==1) {
      print "->Port:1\n";
      print "Flight Name:INDIGO A889\n";
      print "From:Chennai\n";
      print "To:Coimbatore\n";
      print "Depature:12.00\n";
      print "Arrival:02.30\n";
      print "Available seats:22\n";
      print "Fare:4587\n";
      print "--------------------------\n";

      print "->Port:2\n";
      print "Flight Name:AirIndia C88\n";
      print "From:Singapore\n";
      print "To:Coimbatore\n";
      print "Depature:04.00\n";
      print "Arrival:12.30\n";
      print "Available seats:12\n";
      print "Fare:4988\n";
      print "--------------------------\n";
      
      print "->Port:3\n";
      print "Flight Name:INDIGO B128\n";
      print "From:Coimbatore\n";
      print "To:Delhi\n";
      print "Depature:03.00\n";
      print "Arrival:05.30\n";
      print "Available seats:30\n";
      print "Fare:5455\n";
      print "--------------------------\n";
      $std=0;
      
   }
   #     $DbConnection::dataConnection->do('INSERT INTO availability_chart(FlightName,Boarding,Destination,DepatureTime,ArrivalTime,Availableseats,Fare) VALUES(?,?,?,?,?,?,?)',
   #     undef,$FlightName,$from,$to,$depature,$arrival,$available_Seats,$fare);
}

sub booking_page
{
  print ("Select Availability flights:(1|2|3)\n");

}

sub view_details
{

}

sub cancellation_policy
{

}

sub booking_history
{

}


sub menu
{
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
         print("choice invalid\n");
      }
   }

}


sub exitpage
{
   print "Thanks for reserving your flight ticket with us\n";
   print "We Wish you a pleasant flight with us:)\n";
}
1;


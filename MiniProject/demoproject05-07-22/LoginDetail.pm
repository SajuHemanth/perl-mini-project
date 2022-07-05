package LoginDetail;
use strict;
use warnings;
use lib "/home/asplap1195/Desktop/Demoproject";
use Validations;

sub login_user
{
#username 
      print ("**Welcome to Login Page**\n");
      print ("Please Fill The Below Fields\n");
      my $class = shift;
      my $UserName = shift;
      #my $UserName;
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
      my $email_id;
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

sub user_details
{  
#FirstName
      print ("***welcome to Registeration***\n");
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
      my $LastName;
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
      my $phone_no;
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
      my $gender;
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
      my $email_id;
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
sub steps
{
  print ("Please select any of the following steps:\n");
  print ("1.Book tickets \n");
  print ("2.View Booking tickets \n");
  print ("3.Cancellation \n");
  print ("4.View Bookings \n");
  print ("5.User manual \n");
  print ("6.Exit \n");
  my $input =<STDIN>;
   my $std=1;
   while($std==1) {
      if($input =~ /^[1-6]$/) { 
         if($input ==1) {
            my $std2=1;
            
            
         }
      }
   }

}

sub exitpage()
{
   print "Thanks for reserving your flight ticket with us\n";
   print "We Wish you a pleasant flight with us:)\n";
}
1;
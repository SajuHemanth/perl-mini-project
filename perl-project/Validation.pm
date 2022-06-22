package Validation;
use strict;
use warnings;


sub validate_name
{
    my $class = shift;
    my $name = shift;
    if($name eq '')
 {
   print("Please enter the detail,input cannot be empty\n");
return 'false';
 }
    if($name =~ /^([A-z]*)$/) {
      
return 'true';
    }else{
       print("Please enter the name in correct format \n");
return 'false';
    }
    
}

sub validate_phoneNumber
{
    my $class = shift;
    my $phone_no = shift;
    if($phone_no eq '')
 {
   print("Please enter the detail,input cannot be empty\n");
return 'false';
 }

#  if(length($phone_no) > 10)
#  {
#  print("Phone number should be 10 digit\n");
# return 'false';
#  }
    if ($phone_no =~  m{^[6-9]}) {
         if(length($phone_no) < 10 or length($phone_no) > 10)
 {
 print("Phone number should be 10 digit\n");
return 'false';
 }
     
return 'true';
    }else{
       print("Please enter the valid Phone Number \n");
return 'false';
    }
     
}


sub validate_gender
{
    my $class = shift;
    my $gender = shift;
    if($gender eq '')
 {
   print("Please enter the detail,input cannot be empty\n");
return 'false';
 }
    if ($gender =~  m{^[MFTmft]} and length($gender) == 1) {
     
return 'true';
    }else{
       print("Please enter the Correct Gender \n");
return 'false';
    }
    
}

sub validate_studentId
{
    my $class = shift;
    my $student_id = shift;

    if($student_id eq '')
 {
   print("Please enter the detail,input cannot be empty\n");
return 'false';
 }
    if (length($student_id) == 7 and $student_id =~  m{STD[0-9]{4}}) {
   
return 'true';
    }else{
       print("Please enter the valid ID \n");
return 'false';
    }
    
}

sub validate_email
{
    my $class = shift;
    my $email_id = shift;
    if($email_id eq '')
 {
   print("Please enter the detail,input cannot be empty\n");
return 'false';
 }
    #if ($email_id =~ /^[a-z0-9\.]+\@[a-z]+\.com$/) {
      if ($email_id =~ /^[a-z0-9]+@[a-z]+\.edu\.[a-z]{2,3}$/) {
	
return 'true';
    }else{
       print("Please enter the valid Email ID \n");
return 'false';
    }
    
}
1;
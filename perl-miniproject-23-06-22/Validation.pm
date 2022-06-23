package Validation;
use strict;
use warnings;
use Configuration;

sub validate_name
{
    my $class = shift;
    my $name = shift;
    # print "$name";
    if($name eq '')
 {
   print($Configuration::error_name{1});
   
return 'false';
 }
    if($name =~ /^([A-z]*)$/) {
      
return 'true';
    }else{
       print($Configuration::error_name{2});
return 'false';
    }
    
}

sub validate_phoneNumber
{
    my $class = shift;
    my $phone_no = shift;
    if($phone_no eq '')
 {
   print($Configuration::error_phoneNo{3});
return 'false';
 }
    if ($phone_no =~  m{^[6-9]}) {
         if(length($phone_no) < 10 or length($phone_no) > 10)
 {
 print($Configuration::error_phoneNo{4});
return 'false';
 }
     
return 'true';
    }else{
       print($Configuration::error_phoneNo{5});
return 'false';
    }
     
}


sub validate_gender
{
    my $class = shift;
    my $gender = shift;
    if($gender eq '')
 {
   print($Configuration::error_gender{6});
return 'false';
 }
    if ($gender =~  m{^[MFTmft]} and length($gender) == 1) {
     
return 'true';
    }else{
       print($Configuration::error_gender{7});
return 'false';
    }
    
}

sub validate_studentId
{
    my $class = shift;
    my $student_id = shift;

    if($student_id eq '')
 {
   print($Configuration::error_studentId{8});
return 'false';
 }
    if (length($student_id) == 7 and $student_id =~  m{STD[0-9]{4}}) {
   
return 'true';
    }else{
       print($Configuration::error_studentId{9});
return 'false';
    }
    
}

sub validate_email
{
    my $class = shift;
    my $email_id = shift;
    if($email_id eq '')
 {
   print($Configuration::error_email{10});
return 'false';
 }
      if ($email_id =~ /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/) {
	
return 'true';
    }else{
       print($Configuration::error_email{11});
return 'false';
    }
    
}
1;
package Validations;
use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;
use ErrorConfiguration;

sub validate_name
{
    
    my $class = shift;
    my $name = shift;
     if ($name eq ''){
        print($ErrorConfiguration::error_name{1});
        return 'false';
    }
    if ($name =~ /^([A-z ]*)$/) {
       return 'true';
    }
    else {
       #print("error");
       print($ErrorConfiguration::error_name{2});
       return 'false';
    }
    
}   

sub validate_password
{
   my $class = shift;
   my $password = shift;
   if ($password eq '') {
       print($ErrorConfiguration::error_password{12});
       return 'false';
   }
   if ($password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,7}$/) {
       return 'true';
    }
    else {
       print($ErrorConfiguration::error_password{13});
       return 'false';
   }

}

sub validate_email
{
    my $class = shift;
    my $email_id = shift;
    if ($email_id eq '') {
       print($ErrorConfiguration::error_email{10});
       return 'false';
    }
    if ($email_id =~ /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/) {
        return 'true';
    }
    else {
        print($ErrorConfiguration::error_email{11});
        return 'false';
    }
}

sub validate_gender
{
    my $class = shift;
    my $gender = shift;
    if ($gender eq '') {
        print($ErrorConfiguration::error_gender{6});
        return 'false';
    }
    if ($gender =~  m{^[MFTmft]} and length($gender) == 1) {
        return 'true';
    }
    else {
        print($ErrorConfiguration::error_gender{7});
        return 'false';
    }
    
}

sub validate_phoneNumber
{
    my $class = shift;
    my $phone_no = shift;
    if ($phone_no eq '') {
       print($ErrorConfiguration::error_phoneNo{3});
       return 'false';
    }
    if ($phone_no =~  m{^[6-9]}) {
        if(length($phone_no) < 10 or length($phone_no) > 10) {
            print($ErrorConfiguration::error_phoneNo{4});
            return 'false';
        }
        return 'true';
    }
    else {
        print($ErrorConfiguration::error_phoneNo{5});
        return 'false';
    }
}

sub Validate_Userid
      {
    my $class = shift;
    my $UserId = shift;
    if ($UserId eq '') {
        print($ErrorConfiguration::error_userid{14});
        return 'false';
    }
    if (length($UserId) == 6 and $UserId =~  m{FSA[0-9]{3}}) {
        return 'true';
    }
    else {
       print($ErrorConfiguration::error_userid{15});
       return 'false';
    }
    
}

1; 
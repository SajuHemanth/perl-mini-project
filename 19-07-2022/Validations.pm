package Validations;
use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;
use DbConnection;
use Config;

sub validate_name
{
    my $class = shift;
    my $UserName = shift;
    if ($UserName eq '') {
       print($config::error_name{1});
       return 'false';
    }
    if ($UserName =~ /^([A-z ]*)$/) {
       return 'true';
    }
    else {
       print($config::error_name{2});
       return 'false';
    }
}   

sub validate_password
{
   my $class = shift;
   my $password = shift;
   if ($password eq '') {
       print("Please enter the detail,input cannot be empty\n");
       return 'false';
   }
   if ($password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,7}$/) {
       return 'true';
    }
    else {
       print("The Password should contain only 6 to 7 characters\n");
       return 'false';
   }

}

sub validate_email
{
    my $class = shift;
    my $email_id = shift;
    if ($email_id eq '') {
       print("Please enter the detail,input cannot be empty\n");
       return 'false';
    }
    if ($email_id =~ /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/) {
        return 'true';
    }
    else {
        print("please enter the valid emailId\n");
        return 'false';
    }
}

sub validate_gender
{
    my $class = shift;
    my $gender = shift;
    if ($gender eq '') {
        print("Please enter the detail,input cannot be empty\n");
        return 'false';
    }
    if ($gender =~  m{^[MFTmft]} and length($gender) == 1) {
        return 'true';
    }
    else {
        print("Please enter the Correct Gender \n");
        return 'false';
    }
    
}

sub validate_phoneNumber
{
    my $class = shift;
    my $phone_no = shift;
    if ($phone_no eq '') {
       print("Please enter the detail,input cannot be empty\n");
       return 'false';
    }
    if ($phone_no =~  m{^[6-9]}) {
        if(length($phone_no) < 10 or length($phone_no) > 10) {
            print("Phone number should be 10 digit\n");
            return 'false';
        }
        return 'true';
    }
    else {
        print("Please enter the valid Phone Number \n");
        return 'false';
    }
}

sub Validate_Userid
      {
    my $class = shift;
    my $UserId = shift;
    if ($UserId eq '') {
        print("Input cannot be ampty\n");
        return 'false';
    }
    if (length($UserId) == 6 and $UserId =~  m{FSA[0-9]{3}}) {
        return 'true';
    }
    else {
       print("Enter the valid id\n");
       return 'false';
    }
    
}

1; 
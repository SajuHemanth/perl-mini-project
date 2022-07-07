package Validations;
use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;
use DbConnection;

sub validate_name
{
    my $class = shift;
    my $UserName = shift;
    if ($UserName eq '') {
       print("Please enter the detail,input cannot be empty\n");
       return 'false';
    }
    if ($UserName =~ /^([A-z ]*)$/) {
       return 'true';
    }
    else {
       print("Please enter the name in correct format\n");
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
   if ($password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/) {
       return 'true';
    }
    else {
       print("Please enter the valid password\n");
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

1; 
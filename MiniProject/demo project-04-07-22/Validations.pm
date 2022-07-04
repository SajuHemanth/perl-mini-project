package Validations;
use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;

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
1; 
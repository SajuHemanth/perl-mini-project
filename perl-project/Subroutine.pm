package Subroutine;
# use strict;
# use warnings;
use strict;
use warnings;
use DBI;
use DatabaseConnection;
use Validation;
use Subroutine;
#print $DatabaseConnection::myConnection . "\n";
my $connect = $DatabaseConnection::myConnection;


sub add_user
{
   #Student name 
      my $name;
      my $std=1;
      while($std == 1) 
      {
         print "Enter the name:";
      $name = <STDIN>;
      chomp($name);
      my $validate_name=Validation->validate_name($name);
      if($validate_name eq 'true') 
      {
         $std=0;
      }
         
      }

#FathersName Detail
      my $fathersName;
      $std=1;
      while($std == 1) 
      {
         print "Enter the Fathersname:";
      $fathersName=<STDIN>;
      chomp($fathersName);
      my $validate_fathersName=Validation->validate_name($fathersName);
      if($validate_fathersName eq 'true') 
      {
         $std=0;
      }
         
      }

#MothersName Detail
      my $mothersName;
      $std=1;
      while($std == 1) 
      {
         print "Enter the Mothersname:";
      $mothersName=<STDIN>;
      chomp($mothersName);
      my $validate_mothersName=Validation->validate_name($mothersName);
      if($validate_mothersName eq 'true') 
      {
         $std=0;
      }
         
      }

#Phonenumber Details
      my $phone_no;
      $std=1;
      while($std == 1) 
      {
         print "Enter the Phonenumber:";
      $phone_no=<STDIN>;
      chomp($phone_no);
      my $validate_phoneNumber=Validation->validate_phoneNumber($phone_no);
      if($validate_phoneNumber eq 'true') 
      {
         $std=0;
      }

      }


#Gender Detail
      my $gender;
      $std=1;
      while($std == 1) 
      {
         print "Enter the gender(M/F/T):";
      $gender=<STDIN>;
      chomp($gender);
      #if ($gender =~  m{^[MFT]} and length($gender) == 1) {
      my $validate_gender=Validation->validate_gender($gender);
      if($validate_gender eq 'true') 
      {
        $gender=uc($gender);
        # print($gender);
         $std=0;
      }
      
      }

#StudentID Detail
      my $student_id;
      $std=1;
      while($std == 1) 
      {
         print "Enter the Student ID(STDXXXX):";
      $student_id=<STDIN>;
      chomp($student_id);
      my $validate_studentId=Validation->validate_studentId($student_id);
      if($validate_studentId eq 'true')
      {
         $std=0;
      }

      }

#EmailID Details
      my $email_id;
      $std=1;
      while($std == 1) 
      {
         print "Enter the Mail ID:";
      $email_id=<STDIN>;
      chomp($email_id);
      my $validate_email=Validation->validate_email($email_id);
      if($validate_email eq 'true') 
      {
         $std=0;
      }

      }
       print("The user details are added successfully!!!\n");
      $DatabaseConnection::myConnection->do('INSERT INTO students(Name,FatherName,MothersName,PhoneNo,Gender,EmailId,StudentsId) VALUES(?,?,?,?,?,?,?)',
      undef,$name,$fathersName,$mothersName,$phone_no,$gender,$email_id,$student_id);

}

sub modify_user()
{ 
    print("Enter the Student ID to edit:");
   my $student_id= <STDIN>;
   chomp($student_id);
   print ("please choose any of the following options: \n");
print ("1.name   \n");
print ("2.fathersName     \n");
print ("3.mothersname    \n");
print ("4.phoneno   \n");
print ("5.gender   \n");
print ("6.mailId   \n");
print("Enter any key:");
	my $input =<STDIN>;
	if($input =~ /^[1-6]$/)
   {
      if($input ==1)
      {
        my $field = 'Name';
         print ("Enter the name:");
         my $name = <STDIN>;
         
         #update($field,$name);
         my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Name=?  WHERE StudentsId =?"); 
   my $result = $query->execute($name,$student_id);
   

      }
      elsif($input ==2)
      {
        my $field = 'Fathername';
         print ("Enter the fathersName:\n");
         my $fathersName = <STDIN>;
         
         #update($field,$fathersName);
         my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET FatherName=?  WHERE StudentsId =?"); 
   my $result = $query->execute($fathersName,$student_id);

      }
      elsif($input ==3)
      {
         my $field = 'MothersName';
        
         my $mothersName = <STDIN>;
         print ("Enter the MothersName:$mothersName\n");
         #update($field,$mothersName);
         my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET MothersName=?  WHERE StudentsId =?"); 
   my $result = $query->execute($mothersName,$student_id);
      }
      elsif($input ==4)
      {
         my $field = 'PhoneNo';
         
         my $phoneNo = <STDIN>;
         print ("Enter the PhoneNO:$phoneNo\n");
         #update($field,$phoneNo);
         my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET PhoneNo=?  WHERE StudentsId =?"); 
   my $result = $query->execute($phoneNo,$student_id);
      }
      elsif($input ==5)
      {
         my $field = 'Gender';
         
         my $gender = <STDIN>;
         print ("Enter the Gender:$gender\n");
         #update($field,$gender);
         my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Gender=?  WHERE StudentsId =?"); 
   my $result = $query->execute($gender,$student_id);
      }
      elsif($input ==6)
      {
         my $field = 'EmailId';
        
         my $emailId = <STDIN>;
          print ("Enter the EmailID:$emailId\n");
        # update($field,$emailId);
         my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET EmailId=?  WHERE StudentsId =?"); 
   my $result = $query->execute($emailId,$student_id);
      }
   }
#    my $phoneno= <STDIN>;
#    chomp($phoneno);

# my $name;
#       my $std=1;
#       while($std == 1) 
#       {
#          print "Enter the name:";
#       $name = <STDIN>;
#       chomp($name);
#       my $validate_name=Validation->validate_name($name);
#       if($validate_name eq 'true') 
#       {
#          $std=0;
#       }
         
#       }

# #FathersName
#       my $fathersName;
#       $std=1;
#       while($std == 1) 
#       {
#          print "Enter the Fathersname:";
#       $fathersName=<STDIN>;
#       chomp($fathersName);
#       my $validate_fathersName=Validation->validate_name($fathersName);
#       if($validate_fathersName eq 'true') 
#       {
#          $std=0;
#       }
         
#       }

# #MothersName
#       my $mothersName;
#       $std=1;
#       while($std == 1) 
#       {
#          print "Enter the Mothersname:";
#       $mothersName=<STDIN>;
#       chomp($mothersName);
#       my $validate_mothersName=Validation->validate_name($mothersName);
#       if($validate_mothersName eq 'true') 
#       {
#          $std=0;
#       }
         
#       }

# #Phonenumber
#       my $phone_no;
#       $std=1;
#       while($std == 1) 
#       {
#          print "Enter the Phonenumber:";
#       $phone_no=<STDIN>;
#       chomp($phone_no);
#       my $validate_phoneNumber=Validation->validate_phoneNumber($phone_no);
#       if($validate_phoneNumber eq 'true') 
#       {
#          $std=0;
#       }

#       }


# #Gender
#       my $gender;
#       $std=1;
#       while($std == 1) 
#       {
#          print "Enter the gender(M/F/T):";
#       $gender=<STDIN>;
#       chomp($gender);
#       #if ($gender =~  m{^[MFT]} and length($gender) == 1) {
#       my $validate_gender=Validation->validate_gender($gender);
#       if($validate_gender eq 'true') 
#       {
#         $gender=uc($gender);
#         # print($gender);
#          $std=0;
#       }
      
#       }

# #EmailID
#       my $email_id;
#       $std=1;
#       while($std == 1) 
#       {
#          print "Enter the Mail ID:";
#       $email_id=<STDIN>;
#       chomp($email_id);
#       my $validate_email=Validation->validate_email($email_id);
#       if($validate_email eq 'true') 
#       {
#          $std=0;
#       }

#       }

#    my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Name=? ,FatherName=?,Mothersname=?, PhoneNo  =?,Gender=?,EmailId=? WHERE StudentsId =?"); 
#    my $result = $query->execute($name,$fathersName,$mothersName,$phone_no,$gender,$email_id,$student_id);
   
   print("Details modified successfully\n");
}

sub search_user()
{
    print("Enter the Student ID to search:");
   my $student_id= <STDIN>;
   chomp($student_id);
   my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students WHERE StudentsId =?');
   my $result = $query->execute($student_id);
   while(my @row = $query->fetchrow_array())
   {
      print "@row\n\n";    
   }
   print("These are the details from : $student_id !!!\n");

   $query->finish 
   
}

sub delete_user()
{
    print("Enter the Student ID to delete:");
   my $name= <STDIN>;
   my $query = $DatabaseConnection::myConnection->prepare("DELETE from students WHERE Name =?");
   my $result = $query->execute($name);

 print("The user details are deleted successfully!!!\n");
}

sub exit()
{
#    if ($input ==6 ) {
      print("Thankyou for the details!!!");
# 
   
}
sub list_user()
{
# my ($name, $age, $salary);

# format Emp =
# @<@<<<<<<<<<@|||||||||||@<@<<@<<@< 
# '|', $name, '|', $salary, '|', $age, '|'
# .

# $~ = 'Emp';

# header
# print <<EOF;
# +----------------+--------+-----+
# | Employee name  | salary | age |
# +----------------+--------+-----+
# EOF

# my @n = ("Ali", "Raza", "Jaffer");
# my @a  = (20, 30, 40);
# my @s = (2000, 2500, 4000);

# my $i = 0;
# foreach (@n) {
#    $name = $_;
#    $salary = $s[$i];
#    $age = $a[$i];
#    write;
# }

# # footer
# print "+-------------------------+-----+\n";
   my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students');
   my $result = $query->execute();
   # if($result ==0)
   # {
   #    print("There is No data found\n");
   #    return 'false';  #
   # }
   while(my @row = $query->fetchrow_array())
   {
      print "@row\n";
   }
   # print("The user details are listed successfully!!!\n");
   # $query->finish 
    
}

sub menu
{
   my $std=1;
   print ("Do you want go to menu ? (1.yes/2.no):");
my $proceed =<STDIN>;
  chomp($proceed);
   if($proceed == 2)
       {
          $std=0;
         Subroutine->exit();
       }
}
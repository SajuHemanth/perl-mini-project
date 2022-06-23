package Subroutine;
use strict;
use warnings;
use DBI;
use DatabaseConnection;
use Validation;
use Subroutine;
use Configuration;

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
      my $validate_gender=Validation->validate_gender($gender);
      if($validate_gender eq 'true') 
      {
        $gender=uc($gender);
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
   my $validate_studentId=Validation->validate_studentId($student_id);
      if($validate_studentId eq 'true')
      {
         my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students where StudentsID=?');
 my $result = $query->execute("$student_id");
 if($result==0){
print("This ID is not Registered(\n");
      }
      else{
         options($student_id);
      }
      }
      else{
         modify_user();
      }
      
   

   }


sub search_user()
{
    print("Enter the Student ID to search:");
   my $student_id= <STDIN>;
   chomp($student_id);
   my $validate_studentId=Validation->validate_studentId($student_id);
      if($validate_studentId eq 'true')
      {
         # print("Enter a valid Student ID\n");
         # delete_user();
         my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students where StudentsID=?');
 my $result = $query->execute("$student_id");
 if($result ==0)
   {
      print("This ID is not Registered(\n");

   }
   else{
my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students WHERE StudentsId =?');
   my $result = $query->execute($student_id); 
    while(my @row = $query->fetchrow_array())
   {
      print "@row\n\n";    
   }
   print("These are the details from : $student_id !!!\n");

   $query->finish 
 
   }
      }
      else
      {
         search_user();
      }
   # my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students WHERE StudentsId =?');
   # my $result = $query->execute($student_id);
   
   # while(my @row = $query->fetchrow_array())
   # {
   #    print "@row\n\n";    
   # }
   # print("These are the details from : $student_id !!!\n");

   # $query->finish 
   
}

sub delete_user()
{
    print("Enter the Student ID to delete:");
   my $StudentsId= <STDIN>;
   chomp($StudentsId);
  
 my $validate_studentId=Validation->validate_studentId($StudentsId);
      if($validate_studentId eq 'true')
      {
         # print("Enter a valid Student ID\n");
         # delete_user();
         my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students where StudentsID=?');
 my $result = $query->execute("$StudentsId");
 if($result ==0)
   {
      print("This ID is not Registered(\n");

   }
   else{
my $query = $DatabaseConnection::myConnection->prepare("DELETE from students WHERE StudentsID =?");
   my $result = $query->execute("$StudentsId");  
 print("The user details are deleted successfully!!!\n");
   }
      }
      else
      {
         delete_user();
      }
 
   
   
}

sub exitprog()
{
my $id='STD0001';
  my $query = $DatabaseConnection::myConnection->prepare('SELECT * from test.students where StudentsID=?');
 my $result = $query->execute("$id");
 if($result ==0)
   {
      # Subroutine->new();
      print("There is no data to display:(\n");

   }
# else{
# while(my @row = $query->fetchrow_array())
# {
# print "@row\n\n";  
   
# } 
# }
      # print("Thankyou for the details!!!");

   
}
sub list_user()
{
  my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students');
 my $result = $query->execute();
 if($result ==0)
   {
      # Subroutine->new();
      print("There is no data to display:(\n");

   }
else{
while(my @row = $query->fetchrow_array())
{
print "@row\n\n";  
   
} 
}

}

sub menu
{
   my $std=1;
   while($std==1)
   {
   print ("Do you want go to menu ? (1.yes/2.no):");
my $proceed =<STDIN>;
  chomp($proceed);
  if($proceed =~ m{[12]})
  {
   if($proceed == 2)
       {
         
         print("Thankyou for the details!!!");
         exit();
       }
       else
       {
         
         $std=0;
       }
  }
  else
  {
print("choice invalid\n");
  }
   }

}

sub user_menu
{
   print "entry";
   my $std=1;
   while($std==1)
   {
   print ("Do you want go to continue with the process (1.yes/2.no):");
my $proceed =<STDIN>;
  chomp($proceed);
  if($proceed =~ m{[12]})
  {
   if($proceed == 2)
       {
         
         print("The details are modified!!!");
         exit();
       }
       else
       {
         
         $std=0;
       }
  }
  else
  {
print("choice invalid\n");
  }
   }

}

sub options()
{
   my $student_id=$_[0];
  # print($student_id);
print ("please choose any of the following options: \n");
print ("1.name   \n");
print ("2.fathersName     \n");
print ("3.mothersname    \n");
print ("4.phoneno   \n");
print ("5.gender   \n");
print ("6.mailId   \n");
print("Enter any key:");
	my $input =<STDIN>;
   my $std=1;
   while($std==1)
   {
	if($input =~ /^[1-6]$/)
   { 
      if($input ==1)
      {
         my $std2=1;
        #print "outer while std2 = $std2";
        while($std2==1)
        {
          #print "$std2";
        my $field = 'Name';
         print ("Enter the name:");
         my $name = <STDIN>;
         chomp($name);
      my $validate_name=Validation->validate_name($name);
      if($validate_name eq 'true') 
      {
      my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Name=?  WHERE StudentsId =?"); 
      my $result = $query->execute($name,$student_id);
      print "choose another key to modify!!! (1.yes 2.no):";
      my $get = <STDIN>;
      chomp($get);
      if($get == 2)
       {
         $std = 0;
         $std2=0;
         }
         else{
             options();
         }
      }
      #print "$std2";
      }

      }
      elsif($input ==2)
      {
         my $std2=1;
       
        while($std2==1)
        {
        my $field = 'FatherName';
         print ("Enter the name:");
         my $fathersname = <STDIN>;
         chomp($fathersname);
      my $validate_name=Validation->validate_name($fathersname);
      if($validate_name eq 'true') 
      {
         print "$validate_name";
         $std2=0;
         print "std2 = $std2";
      my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET FatherName=?  WHERE StudentsId =?"); 
      my $result = $query->execute($fathersname,$student_id);
       $std = 0;
      }
      }
      }
      elsif($input ==3)
      {
         my $std2=1;
       
        while($std2==1)
        {
        my $field = 'Mothersname';
         print ("Enter the name:");
         my $mothersname = <STDIN>;
         chomp($mothersname);
      my $validate_name=Validation->validate_name($mothersname);
      if($validate_name eq 'true') 
      {
         $std2=0;
         
      my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Mothersname=?  WHERE StudentsId =?"); 
      my $result = $query->execute($mothersname,$student_id);
       $std = 0;
      }
      }
      }
      elsif($input ==4)
      {
         my $std2=1;
       
        while($std2==1)
        {
        my $field = 'PhoneNo';
         print ("Enter the PhoneNumber:");
         my $phoneNo = <STDIN>;
         chomp($phoneNo);
      my $validate_phoneNumber=Validation->validate_phoneNumber($phoneNo);
      if($validate_phoneNumber eq 'true') 
      {
         
         $std2=0;
         
      my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET PhoneNo=?  WHERE StudentsId =?"); 
      my $result = $query->execute($phoneNo,$student_id);
       $std = 0;
      }
      }
      }
      elsif($input ==5)
      {
         my $std2=1;
       
        while($std2==1)
        {
        my $field = 'Gender';
         print ("Enter the gender:");
         my $gender = <STDIN>;
         chomp($gender);
      my $validate_gender=Validation->validate_gender($gender);
      if($validate_gender eq 'true') 
      {
         $std2=0;
       
      my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Gender=?  WHERE StudentsId =?"); 
      my $result = $query->execute($gender,$student_id);
       $std = 0;
      }
      }
   
      }
      elsif($input ==6)
      {
         my $std2=1;
       
        while($std2==1)
        {
         
        my $field = 'EmailId';
         print ("Enter the EmailId:");
         my $EmailId = <STDIN>;
         chomp($EmailId);
      my $validate_email=Validation->validate_email($EmailId);
      if($validate_email eq 'true') 
      {
         
         $std2=0;
         
      my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET EmailId=?  WHERE StudentsId =?"); 
      my $result = $query->execute($EmailId,$student_id);
       $std = 0;
      }
      }
   
   }
   }
   else{
      print("Enter correct key\n");
      options();

   }
   }
}
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
      while($std == 1) {
         print "Enter the name:";
         $name = <STDIN>;
         chomp($name);
         my $validate_name=Validation->validate_name($name);
         if($validate_name eq 'true') {
            $std=0;
            }
         }   

#FathersName Detail
      my $fathersName;
      $std=1;
      while($std == 1) {
         print "Enter the Fathersname:";
         $fathersName=<STDIN>;
         chomp($fathersName);
         my $validate_fathersName=Validation->validate_name($fathersName);
         if($validate_fathersName eq 'true') {
            $std=0;
            }
         
         }

#MothersName Detail
      my $mothersName;
      $std=1;
      while($std == 1) {
         print "Enter the Mothersname:";
         $mothersName=<STDIN>;
         chomp($mothersName);
         my $validate_mothersName=Validation->validate_name($mothersName);
         if($validate_mothersName eq 'true') {
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
         my $validate_phoneNumber=Validation->validate_phoneNumber($phone_no);
         if($validate_phoneNumber eq 'true') {
            $std=0;
         }
      }


#Gender Detail
      my $gender;
      $std=1;
      while($std == 1) {
         print "Enter the gender(M/F/T):";
         $gender=<STDIN>;
         chomp($gender);
         my $validate_gender=Validation->validate_gender($gender);
         if($validate_gender eq 'true') {
            $gender=uc($gender);
            $std=0;
         }
      
      }

#StudentID Detail
      my $student_id;
      $std=1;
      while($std == 1) {
         print "Enter the Student ID(STDXXXX):";
         $student_id=<STDIN>;
         chomp($student_id);
         my $validate_studentId=Validation->validate_studentId($student_id);
         if($validate_studentId eq 'true') {
            $std=0;
         }
      }

#EmailID Details
      my $email_id;
      $std=1;
      while($std == 1) {
         print "Enter the Mail ID:";
         $email_id=<STDIN>;
         chomp($email_id);
         my $validate_email=Validation->validate_email($email_id);
         if($validate_email eq 'true') {
            $std=0;
         }
      }
      #print("The user details are added successfully!!!\n");
      $DatabaseConnection::myConnection->do('INSERT INTO students(Name,FatherName,MothersName,PhoneNo,Gender,EmailId,StudentsId) VALUES(?,?,?,?,?,?,?)',
      undef,$name,$fathersName,$mothersName,$phone_no,$gender,$email_id,$student_id);
      print("The user details are added successfully!!!\n");
}

sub modify_user()
{ 
   modify:
   print("Enter the Student ID to edit:");
   my $student_id= <STDIN>;
   chomp($student_id);
   my $validate_studentId=Validation->validate_studentId($student_id);
   if($validate_studentId eq 'true') {
      my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students where StudentsID=?');
      my $result = $query->execute("$student_id");
      if($result==0) {
         print("This ID is not Registered\n");
      }
      else {
         options($student_id);
      }
      }
      else {
         goto modify;
      }
      
   

}


sub search_user()
{
   search:
   print("Enter the Student ID to search:");
   my $student_id= <STDIN>;
   chomp($student_id);
   my $validate_studentId=Validation->validate_studentId($student_id);
   if($validate_studentId eq 'true') {
      my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students where StudentsID=?');
      my $result = $query->execute("$student_id");
      if($result ==0) {
         print("This ID is not Registered\n");
      }
      else {
         while(my @row = $query->fetchrow_array()) {
            print "@row\n\n";
         }
         print("These are the details from : $student_id !!!\n");
         $query->finish
      }
   }
      else {
         goto search;
      }
}

sub delete_user()
{
   Delete:
   print("Enter the Student ID to delete:");
   my $StudentsId= <STDIN>;
   chomp($StudentsId);
   my $validate_studentId=Validation->validate_studentId($StudentsId);
   if($validate_studentId eq 'true') {
      my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students where StudentsID=?');
      my $result = $query->execute("$StudentsId");
      if($result ==0) {
         print("This ID is not Registered(\n");
      }
      else {
         my $delete_query = $DatabaseConnection::myConnection->prepare("DELETE from students WHERE StudentsID =?");
         my $delete_result = $delete_query->execute("$StudentsId");
         print("The user details are deleted successfully!!!\n");
      }
   }
      else
      {
        goto Delete;
      }
 
   
   
}

sub exitprog()
{
   print "Thankyou for the details!!!";
}
sub list_user()
{
   my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students');
   my $result = $query->execute();
   if($result ==0) {
      print("There is no data to display:(\n");
   }
   else {
      while(my @row = $query->fetchrow_array()) {
         print "@row\n\n";
      } 
   }

}

sub menu
{
   my $std=1;
   while($std==1) {
      print ("Do you want go to menu ? (1.yes/2.no):");
      my $proceed =<STDIN>;
      chomp($proceed);
      if($proceed =~ m{[12]}) {
         if($proceed == 2) {
            print("Thankyou for the details!!!");
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

sub user_menu
{
   my $std=1;
   while($std==1) {
      print ("Do you want go to continue with the process (1.yes/2.no):");
      my $proceed =<STDIN>;
      chomp($proceed);
      if($proceed =~ m{[12]}) {
         if($proceed == 2) {
            print("The details are modified!!!");
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

sub options()
{
   options:
   my $student_id=$_[0];
   print ("please choose any of the following options: \n");
   print ("1.name   \n");
   print ("2.fathersName  \n");
   print ("3.mothersname  \n");
   print ("4.phoneno   \n");
   print ("5.gender   \n");
   print ("6.mailId   \n");
   print("Enter any key:");
   my $input =<STDIN>;
   my $std=1;
   while($std==1) {
      if($input =~ /^[1-6]$/) { 
         if($input ==1) {
            my $std2=1;
            while($std2==1) {
               my $field = 'Name';
               print ("Enter the name:");
               my $name = <STDIN>;
               chomp($name);
               my $validate_name=Validation->validate_name($name);
               if($validate_name eq 'true') {
                  my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Name=?  WHERE StudentsId =?"); 
                  my $result = $query->execute($name,$student_id);
                  print "choose another key to modify!!! (1.yes 2.no):";
                  my $get = <STDIN>;
                  chomp($get);
                  if($get == 2) {
                     $std = 0;
                     $std2=0;
                  }
                  else {
                     goto options;
                  }
               }
     
            }

         }
         elsif($input ==2) {
            my $std2=1;
            while($std2==1) {
               my $field = 'FatherName';
               print ("Enter the Fathers name:");
               my $fathersname = <STDIN>;
               chomp($fathersname);
               my $validate_name=Validation->validate_name($fathersname);
               if($validate_name eq 'true') {
                  $std2=0;
                  my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET FatherName=?  WHERE StudentsId =?"); 
                  my $result = $query->execute($fathersname,$student_id);
                  print "choose another key to modify!!! (1.yes 2.no):";
                  my $get = <STDIN>;
                  chomp($get);
                  if($get == 2) {
                     $std = 0;
                     $std2=0;
                  }
                  else {
                     goto options;
                  }
               }
            }
         }
         elsif($input ==3) {
            my $std2=1;
            while($std2==1) {
               my $field = 'Mothersname';
               print ("Enter the name:");
               my $mothersname = <STDIN>;
               chomp($mothersname);
               my $validate_name=Validation->validate_name($mothersname);
               if($validate_name eq 'true') {
                  $std2=0;
                  my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Mothersname=?  WHERE StudentsId =?"); 
                  my $result = $query->execute($mothersname,$student_id);
                  print "choose another key to modify!!! (1.yes 2.no):";
                  my $get = <STDIN>;
                  chomp($get);
                  if($get == 2) {
                     $std = 0;
                     $std2=0;
                  }
                  else {
                     goto options;
                  }
               }
            }
         }
         elsif($input ==4) {
            my $std2=1;
            while($std2==1) {
               my $field = 'PhoneNo';
               print ("Enter the PhoneNumber:");
               my $phoneNo = <STDIN>;
               chomp($phoneNo);
               my $validate_phoneNumber=Validation->validate_phoneNumber($phoneNo);
               if($validate_phoneNumber eq 'true') {
                  $std2=0;
                  my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET PhoneNo=?  WHERE StudentsId =?"); 
                  my $result = $query->execute($phoneNo,$student_id);
                  print "choose another key to modify!!! (1.yes 2.no):";
                  my $get = <STDIN>;
                  chomp($get);
                  if($get == 2) {
                     $std = 0;
                     $std2=0;
                  }
                  else {
                     goto options;
                  }
               }
            }
         }
         elsif($input ==5) {
            my $std2=1;
            while($std2==1) {
               my $field = 'Gender';
               print ("Enter the gender:");
               my $gender = <STDIN>;
               chomp($gender);
               my $validate_gender=Validation->validate_gender($gender);
               if($validate_gender eq 'true') {
                  $std2=0;
                  my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET Gender=?  WHERE StudentsId =?"); 
                  my $result = $query->execute($gender,$student_id);
                  print "choose another key to modify!!! (1.yes 2.no):";
                  my $get = <STDIN>;
                  chomp($get);
                  if($get == 2) {
                  $std = 0;
                  $std2=0;
                  }
                  else {
                     goto options;
                  }
               }
            }
   
         }
         elsif($input ==6) {
            my $std2=1;
            while($std2==1) {
               my $field = 'EmailId';
               print ("Enter the EmailId:");
               my $EmailId = <STDIN>;
               chomp($EmailId);
               my $validate_email=Validation->validate_email($EmailId);
               if($validate_email eq 'true') {
                  $std2=0;
                  my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET EmailId=?  WHERE StudentsId =?"); 
                  my $result = $query->execute($EmailId,$student_id);
                  print "choose another key to modify!!! (1.yes 2.no):";
                  my $get = <STDIN>;
                  chomp($get);
                  if($get == 2) {
                     $std = 0;
                     $std2=0;
                  }
                  else {
                     goto options;
                  }
               }
            }
         }
      }
      else {
         print("Enter correct key\n");
         goto options;
      }
   }
}



# sub user_menu
# {
#    my $std=1;
#    while($std==1) {
#       print ("Do you want go to continue with the process (1.yes/2.no):");
#       my $proceed =<STDIN>;
#       chomp($proceed);
#       if($proceed =~ m{[12]}) {
#          if($proceed == 2) {
#             print("The details are modified!!!");
#             exit();
#          }
#          else {
#             $std=0;
#          }
#       }
#       else {
#          print("choice invalid\n");
#       }
#    }

# }

sub search_options()
{
   search_options:
   print ("please choose any of the following options: \n");
   print ("1.name   \n");
   print ("2.fathersName  \n");
   print ("3.mothersname  \n");
   print ("4.phoneno   \n");
   print ("5.gender   \n");
   print ("6.mailId   \n");
   print("Enter any key:");
   my $input =<STDIN>;
   my $std=1;
   while($std==1) {
      if($input =~ /^[1-6]$/) { 
         if($input ==1) {
            my $std2=1;
            while($std2==1) {
               my $field = 'Name';
               print ("Enter the name:");
               my $name = <STDIN>;
               chomp($name);
               my $validate_name=Validation->validate_name($name);
               if($validate_name eq 'true') {
                  my $query = $DatabaseConnection::myConnection->prepare("SELECT * from students where Name=?"); 
                  my $result = $query->execute($name);
                  if($result==0) {
                     print("This ID is not Registered\n");
                  }
                  else{
                     while(my @row = $query->fetchrow_array()) {
                        print "@row\n\n";
                     }
                     print("These are the details from :$name !!!\n");
                     $query->finish;
                     name_options:
                     print("Do you want to continue: (1.yes 2.no):");
                     my $continue = <STDIN>;
                     chomp($continue);
                     if($continue==1) {
                        goto search_options;
                     }
                     elsif($continue==2) {
                        $std=0;
                        $std2=0;
                     }
                     else {
                        print("Invalid options\n");
                        goto name_options;
                     }
                  }
               }
      
            }
     
         }
         elsif($input ==2) {
            my $std2=1;
            while($std2==1) {
               my $field = 'Name';
               print ("Enter the name:");
               my $fathersname = <STDIN>;
               chomp($fathersname);
               my $validate_name=Validation->validate_name($fathersname);
               if($validate_name eq 'true') {
                  my $query = $DatabaseConnection::myConnection->prepare("SELECT * from students where FatherName=?"); 
                  my $result = $query->execute($fathersname);
                  if($result==0) {
                     print("This ID is not Registered\n");
                  }
                  else{
                     while(my @row = $query->fetchrow_array()) {
                        print "@row\n\n";
                     }
                     print("These are the details from :$fathersname !!!\n");
                     $query->finish;
                     fathersname_options:
                     print("Do you want to continue: (1.yes 2.no):");
                     my $continue = <STDIN>;
                     chomp($continue);
                     if($continue==1) {
                        goto search_options;
                     }
                     elsif($continue==2) {
                        $std=0;
                        $std2=0;
                     }
                     else {
                        print("Invalid options\n");
                        goto fathersname_options;
                     }
                  }
               }
      
            }
     
         }
         elsif($input ==3) {
            my $std2=1;
            while($std2==1) {
               my $field = 'MothersName';
               print ("Enter the mothersname:");
               my $mothersname = <STDIN>;
               chomp($mothersname);
               my $validate_name=Validation->validate_name($mothersname);
               if($validate_name eq 'true') {
                  my $query = $DatabaseConnection::myConnection->prepare("SELECT * from students where MothersName=?"); 
                  my $result = $query->execute($mothersname);
                  if($result==0) {
                     print("This ID is not Registered\n");
                  }
                  else{
                     while(my @row = $query->fetchrow_array()) {
                        print "@row\n\n";
                     }
                     print("These are the details from :$mothersname !!!\n");
                     $query->finish;
                     mothersname_options:
                     print("Do you want to continue: (1.yes 2.no):");
                     my $continue = <STDIN>;
                     chomp($continue);
                     if($continue==1) {
                        goto search_options;
                     }
                     elsif($continue==2) {
                        $std=0;
                        $std2=0;
                     }
                     else {
                        print("Invalid options\n");
                        goto mothersname_options;
                     }
                  }
               }
      
            }
     
         }
         elsif($input ==4) {
            my $std2=1;
            while($std2==1) {
               my $field = 'PhoneNo';
               print ("Enter the phonenumber:");
               my $PhoneNo = <STDIN>;
               chomp($PhoneNo);
               my $validate_phoneNumber=Validation->validate_phoneNumber($PhoneNo);
               if($validate_phoneNumber eq 'true') {
                  my $query = $DatabaseConnection::myConnection->prepare("SELECT * from students where PhoneNo=?"); 
                  my $result = $query->execute($PhoneNo);
                  if($result==0) {
                     print("This ID is not Registered\n");
                  }
                  else {
                     while(my @row = $query->fetchrow_array()) {
                        print "@row\n\n";
                     }
                     print("These are the details from :$PhoneNo !!!\n");
                     $query->finish;
                     PhoneNo_options:
                     print("Do you want to continue: (1.yes 2.no):");
                     my $continue = <STDIN>;
                     chomp($continue);
                     if($continue==1) {
                        goto search_options;
                     }
                     elsif($continue==2) {
                        $std=0;
                        $std2=0;
                     }
                     else {
                        print("Invalid options\n");
                        goto PhoneNo_options;
                     }
                  }
               }
            }
         }
         elsif($input ==5) {
            my $std2=1;
            while($std2==1) {
               my $field = 'Gender';
               print ("Enter the Gender(M/F/T):");
               my $gender = <STDIN>;
               chomp($gender);
               my $validate_gender=Validation->validate_gender($gender);
               if($validate_gender eq 'true') {
                  my $query = $DatabaseConnection::myConnection->prepare("SELECT * from students where Gender=?"); 
                  my $result = $query->execute($gender);
                  if($result==0) {
                     print("This ID is not Registered\n");
                  }
                  else {
                     while(my @row = $query->fetchrow_array()) {
                        print "@row\n\n";
                     }
                     print("These are the details from :$gender !!!\n");
                     $query->finish;
                     gender_options:
                     print("Do you want to continue: (1.yes 2.no):");
                     my $continue = <STDIN>;
                     chomp($continue);
                     if($continue==1) {
                        goto search_options;
                     }
                     elsif($continue==2) {
                        $std=0;
                        $std2=0;
                     }
                     else {
                        print("Invalid options\n");
                        goto gender_options;                     
                     }
                  }
               }
            }
         }
         elsif($input ==6) {
            my $std2=1;
            while($std2==1) {
               my $field = 'EmailId';
               print ("Enter the mailid:");
               my $mailid = <STDIN>;
               chomp($mailid);
               my $validate_email=Validation->validate_email($mailid);
               if($validate_email eq 'true') {
                  my $query = $DatabaseConnection::myConnection->prepare("SELECT * from students where EmailId=?"); 
                  my $result = $query->execute($mailid);
                  if($result==0) {
                     print("This ID is not Registered\n");
                  }
                  else {
                     while(my @row = $query->fetchrow_array()) {
                        print "@row\n\n";
                     }
                     print("These are the details from :$mailid !!!\n");
                     $query->finish;
                     mailid_options:
                     print("Do you want to continue: (1.yes 2.no):");
                     my $continue = <STDIN>;
                     chomp($continue);
                     if($continue==1) {
                        goto search_options;
                     }
                     elsif($continue==2) {
                        $std=0;
                        $std2=0;
                     }
                     else {
                        print("Invalid options\n");
                        goto mailid_options;                     
                     }
                  }
               }
            }
         }
      }      
      else {
         print("Please select the valid options: \n");
         goto search_options;
      }
   }
}


      




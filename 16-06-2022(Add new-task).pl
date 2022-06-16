use strict;
use warnings;
use DBI;
use DatabaseConnection;
print $DatabaseConnection::myConnection . "\n";
my $connect = $DatabaseConnection::myConnection;
#my $myConnection = DBI->connect('DBI:mysql:test:localhost','root','Hemanth@2012') or die "Can't connect to database: $DBI::errstr!\"; 



my $str = "==================WELCOME TO PHONEBOOK====================";
print "$str\n";
print ("\n     **** MENU ****   \n");
print ("please choose any of the following options: \n");
print ("1.Add New  \n");
print ("2.List     \n");
print ("3.Exit     \n");
print ("4.Modify   \n");
print ("5.Search   \n");
print ("6.Delete   \n");

add_user();

my $input;
my $std=1;
while($std){
	$input =<STDIN>;
	if($input =~ /^[1-6]$/){
		$std=0;
	}else{
		print("Enter any key:");
		
	}
	
}

chop ($input);

#adding new user details
#my $name = <STDIN>;
#chomp $name;
#print "Enter the name:", $name;

sub add_user
{
my ($name,$address,$fathers_name,$mothers_name,$phone_no,$gender,$email_id,$student_no);

$name =$ARGV[0];
$fathers_name =$ARGV[1];
$mothers_name =$ARGV[2];
$phone_no =$ARGV[3];
$gender =$ARGV[4];
$email_id =$ARGV[5];
$student_no =$ARGV[6];
$DatabaseConnection::myConnection->do('INSERT INTO students(Name,FatherName,MothersName,PhoneNo,Gender,EmailId,StudentsId) VALUES(?,?,?,?,?,?,?)',
 undef,$name,$fathers_name,$mothers_name,$phone_no,$gender,$email_id,$student_no);
}
#Name validation
#-----------------

my $name;
$std=1;
while($std == 1) {
    $name=$ARGV[0];
    if($name =~ /^([A-z]*)$/) {
       $std=0;
    }else{
       print("ERROR:Please enter the name in correct format");
    }
$std++
}
chop($name);


my $fathers_name;
$std=1;
while($std == 1) {
    $fathers_name=$ARGV[0];
    if($fathers_name =~ /^([A-z]*)$/) {
       $std=0;
    }else{
       print("ERROR:Please enter the fathers_name in correct format \n");
    }
$std++
}
chop($fathers_name);

my $mothers_name;
$std=1;
while($std == 1) {
    $mothers_name=$ARGV[0];
    if($mothers_name =~ /^([A-z]*)$/) {
       $std=0;
    }else{
       print("ERROR:Please enter the mothers_name in correct format \n");
    }
$std++
}
chop($mothers_name);

#phoneNumber validation
#------------------------
my $phone_no;
$phone_no =$ARGV[3];
chomp $phone_no;

if (length($phone_no) == 10 and $phone_no =~  m{^[6-9]}) {
  print "$phone_no is valid number \n";
}
else {
  print "$phone_no is not a valid number \n";
}


#emailId validation
#-------------------

my $email_id;
$std=1;
while($std == 1) {
    $email_id=$ARGV[0];
    if($email_id =~ /^[a-z0-9.]+\@[a-z0-9.-]+$/) {
       $std=0;
    }else{
       print("Please enter the valid Emailid");
    }
$std++
}
chop($email_id);





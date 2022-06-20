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
print ("3.Modify     \n");
print ("4.Search   \n");
print ("5.Delete   \n");
print ("6.Exit   \n");


my $input;
my $std=1;
while($std==1){
    print("Enter any key:");
	$input =<STDIN>;
	if($input =~ /^[1-6]$/){
if($input==1)
{
add_user();
}
elsif($input==2)
{
    list_user();
}

elsif($input==3)
{
    modify_user();
}
elsif($input==4)
{
    search_user();
}
elsif($input==5)
{
    delete_user();
}
elsif($input==6)
{
    exit();
}
		
	}else{
		print("Enter correct key:");
		
	}
	
}

chop ($input);
sub add_user
{
my $name;
my $std=1;
while($std == 1) {
print "Enter the name:";
 $name = <STDIN>;
    if($name =~ /^([A-z]*)$/) {
       $std=0;
    }else{
       print("ERROR:Please enter the name in correct format \n");
    }
}

my $fathersName;
$std=1;
while($std == 1) {
print "Enter the Fathersname:";
    $fathersName=<STDIN>;
    if($fathersName =~ /^([A-z]*)$/) {
       $std=0;
    }else{
       print("ERROR:Please enter the fathers_name in correct format \n");
    }
}

my $mothersName;
$std=1;
while($std == 1) {
   print "Enter the Mothersname:";
    $mothersName=<STDIN>;
    
    if($mothersName =~ /^([A-z]*)$/) {
       $std=0;
    }else{
       print("ERROR:Please enter the mothers_name in correct format \n");
    }
}

my $phone_no;
$std=1;
while($std == 1) {
   print "Enter the Phonenumber:";
    $phone_no=<STDIN>;
    chomp($phone_no);
    my $result = length($phone_no);
    print $result;
if ($phone_no =~  m{^[6-9]} and length($phone_no) == 10) {
  $std=0;
}
else {
  print "$phone_no is not a valid number \n";
}

}


my $gender;
$std=1;
while($std == 1) {
   print "Enter the gender(M/F/T):";
    $gender=<STDIN>;
    chomp($gender);
if ($gender =~  m{^[MFT]} and length($gender) == 1) {
  $std=0;
}
else {
  print "Gender is not valid\n";
}
}

my $student_id;
$std=1;
while($std == 1) {
   print "Enter the Student ID(STDXXXX):";
    $student_id=<STDIN>;
    chomp($student_id);
if (length($student_id) == 7 and $student_id =~  m{STD[0-9]{4}}) {
  $std=0;
}
else {
  print "Student ID is not valid \n";
}
}

my $email_id;
$std=1;
while($std == 1) {
   print "Enter the Mail ID:";
    $email_id=<STDIN>;
if ($email_id =~ /^[a-z0-9\.]+\@[a-z]+\.com$/) {
  $std=0;
}
else {
  print "Please enter the valid Email ID\n";
}
}

$DatabaseConnection::myConnection->do('INSERT INTO students(Name,FatherName,MothersName,PhoneNo,Gender,EmailId,StudentsId) VALUES(?,?,?,?,?,?,?)',
 undef,$name,$fathersName,$mothersName,$phone_no,$gender,$email_id,$student_id);

}

sub list_user()
{
 my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students');
 my $result = $query->execute();

while(my @row = $query->fetchrow_array()){
print "@row\n\n";

}

$query->finish 
}

#20

sub modify_user()
{
   
   my $student_id= <STDIN>;
   chomp($student_id);
my $query = $DatabaseConnection::myConnection->prepare("UPDATE students SET PhoneNo  = '8089899080' WHERE StudentsId =?"); 
 my $result = $query->execute($student_id);
# my $query = $DatabaseConnection::myConnection->prepare('SELECT * from persons');
$query->finish
}

sub search_user()
{
my $student_id= <STDIN>;
chomp($student_id);
my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students WHERE StudentsId =?');
 my $result = $query->execute($student_id);

while(my @row = $query->fetchrow_array()){
print "@row\n\n";
}

$query->finish 
}

sub delete_user()
{
# my $query = $DatabaseConnection::myConnection->do("DELETE from students WHERE Name ='karthik'"); 
# #my $result = $query->execute();
# my $query = $DatabaseConnection::myConnection->prepare('SELECT * from students');
# my $result = $query->execute();
my $name= <STDIN>;
my $query = $DatabaseConnection::myConnection->prepare("DELETE from students WHERE Name =?");
 my $result = $query->execute($name);


while(my @row = $query->fetchrow_array()){
print "@row\n";
}

$query->finish
}

sub exit()
{
if ($input ==6 ) {
   print("\t ThankYou For The Details!!!");
}
}
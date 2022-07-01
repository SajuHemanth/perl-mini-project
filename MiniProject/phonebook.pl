use strict;
use warnings;
use DBI;
use DatabaseConnection;
use Validation;
use Subroutine;
use Configuration;
my $connect = $DatabaseConnection::myConnection;
print "==================WELCOME TO PHONEBOOK====================";
my $input;
my $std=1;
while($std==1) {
    print ("\n     ******* MENU *******   \n");
    print ("please choose any of the following options: \n");
    print ("1.Add New  \n");
    print ("2.List     \n");
    print ("3.Modify     \n");
    print ("4.Search   \n");
    print ("5.Delete   \n");
    print ("6.Exit   \n");
    print("Enter any key:");
    $input =<STDIN>;
    if ($input =~ /^[1-6]$/) {
        if($input==1) {
            Subroutine->add_user();
            Subroutine->menu();
        }
        elsif($input==2) {
            Subroutine->list_user();
            Subroutine->menu();
        }
        elsif($input==3) {
            Subroutine->modify_user();
            Subroutine->user_menu();
            Subroutine->menu();
        }
        elsif($input==4) {
            Subroutine->search_user();
            Subroutine->menu();
        }
        elsif($input==5) {
            Subroutine->delete_user();
            Subroutine->menu();
        }
        elsif($input==6) {
            Subroutine->exitprog();
            $std=0;
        }
    }
        else {
            print("Enter correct key:");
	    }
	
}





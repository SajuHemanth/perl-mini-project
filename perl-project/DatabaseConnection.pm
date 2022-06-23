package DatabaseConnection;
use DBI;
use strict;
use warnings;

our $myConnection = DBI->connect('DBI:mysql:test:localhost','root','Hemanth@2012');

1;
package DbConnection;
use DBI;
use strict;
use warnings;

my $driver='mysql';
my $password='Hemanth@2012';
my $username='root';
my $database='test';
my $host='localhost';
my $dsn="DBI:$driver:database=$database:$host";
our $dataConnection = DBI->connect($dsn,$username,$password);
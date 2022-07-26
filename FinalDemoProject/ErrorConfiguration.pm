package ErrorConfiguration;
use lib "/home/asplap1195/Desktop/DemoProject";
use strict;
use warnings;

our %error_name=('1'=>"Please enter the detail,input cannot be empty\n",
                 '2'=>"Please enter the name in correct format\n");

our %error_phoneNo=('3'=>"Please enter the detail,input cannot be empty\n",
                    '4'=>"Phone number should be 10 digit\n",
                    '5'=>"Please enter the valid Phone Number \n");

our %error_gender=('6'=>"Please enter the detail,input cannot be empty\n",
                   '7'=>"Please enter the Correct Gender \n");

our %error_studentId=('8'=>"Please enter the detail,input cannot be empty\n",
                      '9'=>"Please enter the valid ID \n");

our %error_email=('10'=>"Please enter the detail,input cannot be empty\n",
                  '11'=>"Please enter the valid Email ID \n");

our %error_password=('12'=>"Please enter the detail,input cannot be empty\n",
                     '13'=>"The Password should contain only 6 to 7 characters\n");

our %error_userid=('14'=>"Please enter the detail,input cannot be empty\n",
                   '15'=>"Enter the valid ID\n");

our %error_message=('1'=>"Your MailId is not Registered so please login with New Registration");

our %error_query=('1'=>"SELECT * from UserDetails where EmailId=?",
                  '2'=>"SELECT * from UserDetails where EmailId=?",
                  '3'=>"INSERT INTO UserDetails(FirstName,LastName,Gender,EmailId,PhoneNumber,UserId) VALUES(?,?,?,?,?,?)",
                  '4'=>"INSERT INTO UserDetails(FirstName,LastName,Gender,EmailId,PhoneNumber,UserId) VALUES(?,?,?,?,?,?)",
                  '5'=>"SELECT * from availability_chart",
                  '6'=>"SELECT * from availability_chart WHERE Boarding = ? and Destination = ?",
                  '7'=>"SELECT * from availability_chart WHERE FlightId = ? and Boarding = ? and Destination = ?",
                  '8'=>"INSERT INTO testtable(User_Id,Flight_Id,Seats) VALUES(?,?,?)",
                  '9'=>"SELECT users.UserId, users.FirstName , users.LastName , flight.FlightId, flight.Boarding , flight.Destination , flight.DepatureTime , flight.Arrivaltime ,flight.Fare, tab.Seats , flight.Fare*tab.Seats AS total_fare 
                        FROM test.testtable tab JOIN test.UserDetails users  ON users.UserId = tab.user_id JOIN test.availability_chart flight ON flight.FlightId = tab.flight_id 
                        WHERE users.UserId=?");

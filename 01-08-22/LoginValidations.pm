# package LoginValidations;
# use strict;
# use warnings;
# use LoginValidations;
# use Cancellation;
# use Menu;
# use ViewDetail;
# use BookingPage;
# use RegisterationValidation;
# use AvailabilityChart;
# use LoginDetail;
# use Validations;
# use DbConnection;
# sub validate_password
# {
#    my $class = shift;
#    my $password = shift;
#    if ($password eq '') {
#        print($ErrorConfiguration::error_password{12});
#        return 'false';
#    }
#    if ($password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,7}$/) {
#        return 'true';
#     }
#     else {
#        print($ErrorConfiguration::error_password{13});
#        return 'false';
#    }

# }

# sub validate_mailId
# {
#     my $class = shift;
#     my $email_id = shift;
#     if ($email_id eq '') {
#        print($ErrorConfiguration::error_email{10});
#        return 'false';
#     }
#     if ($email_id =~ /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/) {
#         return 'true';
#     }
#     else {
#         print($ErrorConfiguration::error_email{11});
#         return 'false';
#     }
# }
# 1;
# package Availabilitychart;
# use strict;
# use warnings;
# # use LoginValidations;
# # use Cancellation;
# # use Menu;
# # use ViewDetail;
# # use BookingPage;
# # use RegisterationValidation;
# # use AvailabilityChart;
# # use LoginDetail;
# # use Validations;
# use ErrorConfiguration;
# use DbConnection;
# my $connection= $DbConnection::dataConnection;

# sub availability_chart
# {
#    print ("The Flights Availability are displayed below:\n");
#    print ("----------------------------------------------\n");
#    my $query=$DbConnection::dataConnection->prepare($ErrorConfiguration::error_query{5});
#    my $result = $query->execute();
#    if($result ==0) {
#       warn "There is no data to display"
#    }
#    else {
#       while(my @row = $query->fetchrow_array()) {
#          print "@row\n\n";
#       }
#    }
# }
# 1;
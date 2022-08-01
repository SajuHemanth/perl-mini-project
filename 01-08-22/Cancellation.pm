# package cancellation;
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
# my $connection= $DbConnection::dataConnection;

# sub cancellation_policy
# { 
#   print ("Cancellation page:\n");
#   print ("--------------------\n");
#   print ($ErrorConfiguration::error_print{6});
#   my $reason1 ="\n1.Medical Emergency";
#   my $reason2 ="2.Travelling plan changed";
#   my $reason3 ="3.Missed Flight";
#   my $reason4 ="4.Other Reasons";
#   print ("$reason1\n");
#   print ("$reason2\n");
#   print ("$reason3\n");
#   print ("$reason4\n");
#   print $ErrorConfiguration::error_print{4};
#   my $detail=<STDIN>;
#   chomp($detail);
#    if($detail== 1) {
#       print ("$reason1\n");
#       print ($ErrorConfiguration::error_print{5});
#    }
#    elsif($detail== 2) {
#       print ("$reason2\n");
#       print ($ErrorConfiguration::error_print{5});
#    }
#    elsif($detail== 3) {
#       print ("$reason3\n");
#       print ($ErrorConfiguration::error_print{5});
#    }
#    elsif($detail== 4) {
#       print("$reason4\n");
#       print ($ErrorConfiguration::error_print{5});

#    }
#    else {
#       warn ($ErrorConfiguration::error_print{6});
#    }
# }
# 1;
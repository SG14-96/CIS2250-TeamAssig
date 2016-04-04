#!/usr/bin/perl
#
#   Packages and modules
#
use strict;
use warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Text::CSV  1.32;   # We will be using the CSV module (version 1.32 or higher)
                       # to parse each line


#
#   cis2250project.pl
#      Author(s): Dickson D'Cunha (0904177),
#                 Alejandro Lobo Mujica (0911715)
#                 Santiago Gutierrez (0895285)
#                 Henry Nguyen (0884653)
#      Project: Cis 2250's Final Deliverable
#      Date of Last Update: Tuesday March 29th, 2016
#
#      Functional Summary
#
#      Commandline Parameters: 1
#         $ARGV[0] = name of the input file containing the names
#
#      References
#         Name files from http://www.ssa.gov/OACT/babynames/limits.html
#

############
# Global Variables
#

my $TRUE        = 1;
my $FALSE       = 0;
my $NEW_LINE    = "\n";
my $SPACE       = " ";

my $startingYear    = "";
my $endingYear      = "";


############
# Main
#


clearScreen();
getYearRange();


############
# Subroutines
#

sub getYearRange{
    my $continue = $FALSE;
    print "Choose the range of years you would like to examine (Min: 1994 - Max: 2014).\n";

    do {
       print "Starting year:";
       $startingYear = <STDIN>;
       $continue = validateStartYear($startingYear);

       if($continue == $FALSE){
         print "Invalid start year. Must be in the range of 1994 to 2014.".$NEW_LINE;
       }

    } while($continue == $FALSE);
    chomp $startingYear;

    do {
       print "Ending year:";
       $endingYear = <STDIN>;
       $continue = validateEndYear($endingYear);

       if($continue == $FALSE){
         print "Invalid start year. Must be in the range of ".$startingYear." to 2014.".$NEW_LINE;
       }

    } while($continue == $FALSE);

    chomp $endingYear;

    # print $startingYear." ".$endingYear.$NEW_LINE;
}

sub validateStartYear{
    my $year = $_[0];

    if ($year =~ /\D/){
       return $FALSE;
    }

    if($year < 1994){
       return $FALSE;
    }
    elsif($year > 2014){
       return $FALSE;
    }
    else{
       return $TRUE
    }
}

sub validateEndYear{
    my $year = $_[0];

    if ($year =~ /\D/){
       return $FALSE;
    }

    if($year < $startingYear){
       return $FALSE;
    }
    elsif($year > 2014){
       return $FALSE;
    }  
    else{
       return $TRUE
    }
}

sub clearScreen{
    system("clear");
    return;
}

# TODO
# Present users 
# Get user input for which template they want to use





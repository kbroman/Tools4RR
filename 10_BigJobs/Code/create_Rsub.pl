#!/usr/bin/perl
######################################################################
# create_Rsub.pl
#
# the aim is to create a set of R input files 
# for running a set of R files on my multi-processor computer
#
# Create a single R file containing the string SUB whereever you
# want to substitute a number.
#
# Go to the directory you want to run your R jobs, and type 
#     create_Rsub.pl input.R 0 25
# replacing input.R with your R input file, and 0 and 25 with the
# lower and upper numbers for your runs.
#
# This perl script will create a set of R input files, in??.R,
# and shell script "allin" that can be used to start the jobs.
# 
######################################################################

use Cwd;

if(@ARGV == 1) {  # assume there's just one thing to do,
                  # so don't do the substitution, and just 
                  # create a shell script
    $ifile = $ARGV[0];
    $first = $last = 1;
    $onefile = 1;
}
elsif(@ARGV == 3) {
    $ifile = $ARGV[0];
    $first = $ARGV[1];
    $last = $ARGV[2];
    $onefile = 0;
}
else {
    die("Give R input template and beginning and ending numbers\n");
}

unless($onefile) {
    open(IN, $ifile) or die("Cannot read from $ifile");
    while($line = <IN>) {
	chomp($line);
	push(@lines, $line);
    }
    close(IN);
}

$cwd = getcwd();

unless($onefile) {
    open(OUT2, ">allin") or die("Cannot write to allin");
}

foreach $i ($first..$last) {
    if($onefile) {
	$ofile = $ifile;
	$ifile =~ /(\w+)\.R/;
	$jfile = $1 . "_out.txt";
	$job = $1;
    }
    else {
	$j = $i; if($j < 10) { $j = "0$i"; }

	$ofile = "in" . $j . ".R";
	$job = "in" . $j;
	open(OUT, ">$ofile") or die("Cannot write to $ofile");
	@temp = @lines;
	foreach $line (@temp) {
	    $line =~ s/SUB/$j/g;
	    print OUT ("$line\n");
	}
	close(IN);
	$jfile = "out" . $j . ".txt";
    }


    if($i == $first) {    print OUT2 ("#!/bin/bash\n\n"); }
    print OUT2 ("nice -n 20 R CMD BATCH --no-save $ofile $jfile &\n");
}
close(OUT2);
unless($onefile) {
    system("chmod +x allin");
}

# end of create_Rsub.pl

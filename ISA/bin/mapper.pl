#!/usr/bin/perl

use strict;

my $fn = $ARGV[0];

open(FILE, $fn) or die "Cannot open file $fn for reading:  $!";

my %map = (
          'Comment [subject]' => "Comment[subject]",
          'Comment [Subject]' => "Comment[subject]",
          'Comment [source_id]' => "Comment[source_id]",
          'Characteristics [BioSampleID]' => "Sample Name",
          'Characteristics [Country]' => "Characteristics[country]",
          'Characteristics [ClearanceTime]' => "Characteristics [clearance time]",
          'Characteristics [Organism]' => "Characteristics[organism]",
          'Characteristics [InfectionType]' => "Characteristics[infection type]",
          'Characteristics [ParasitemiaStart]' => "Characteristics[parasitemia start]",
          'Source Name' => "Source Name",
          'Characteristics [StrainOrLine]' => "Characteristics[strain]",
          'Characteristics [GeographicLocation]' => "Characteristics[geographic location]",
          'Characteristics [Year]' => "Characteristics[year]",
          'Characteristics [Haplogroup]' => "Characteristics[haplogroup]",
          'Characteristics [ClearanceHalfLife]' => "Characteristics[clearance half life]",
          'Characteristics [TreatmentOutcome]' => "Characteristics[treatment outcome]",
          'Characteristics [SquidProject]' => "Characteristics[squid project]",
          'Characteristics [BioSourceType]' => "Characteristics[environmental feature]",
          'Characteristics [DiseaseState]' => "Characteristics[disease state]",
          'Characteristics [ATCC#]' => "Characteristics[ATCC #]",
          'Characteristics [Host]' => "Characteristics[host organism]",
          'Characteristics [HostAge]' => "Characteristics[age]",
          'Characteristics [ClinicalPhenotype]' => "Characteristics[clinical phenotype]",
          'Characteristics [ClearanceRate]' => "Characteristics[clearance rate]",
          'Characteristics [DateCollected]' => "Parameter Value[collection date]",
          'Characteristics [StudyArm]' => "Characteristics[study arm]",
          'Description' => "Comment[description]",
          'Characteristics [HostSex]' => "Characteristics[sex]",
          'Data File' => "Raw Data File",
    );


my $header = <FILE>;
chomp $header;

my @h = split(/\t/, $header);
my @nh;
foreach(@h) {
    my $v = $map{$_} or die "No map for $_";
    push @nh, $v;
}

print join("\t", @nh) . "\n";
while(<FILE>) {
    print;
}



1;

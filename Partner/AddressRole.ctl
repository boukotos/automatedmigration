OPTIONS 
   ( skip=1     )
load data
CHARACTERSET UTF8
infile "AddressRole.txt"	
truncate into table IMP_ADR
fields terminated by "," optionally enclosed by '"'
TRAILING NULLCOLS
(ADRREF,
ADRCOMP,
ADRADREF,
ADRRTYPE)

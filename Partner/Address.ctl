OPTIONS 
   ( skip=1     )
load data
CHARACTERSET UTF8
infile "Address.txt"	
truncate into table IMP_AD
fields terminated by "," optionally enclosed by '"'
TRAILING NULLCOLS
(ADREF,
ADNO,
ADCOMP,
ADSTR,
ADCITY,
ADZIP,
ADLNGREF,
ADPRTREF,
ADCNTRREF,
ADNAME,
ADLINE2,
ADLINE3,
ADSTAT,
ADCNTY,
ADREM,
ADCRMNO,
ADINTSTAT)

OPTIONS 
   ( skip=1     )
load data
CHARACTERSET UTF8
infile "CustomerVAT.txt"	
truncate into table IMP_CV
fields terminated by "," optionally enclosed by '"'
TRAILING NULLCOLS
(CVREF,
CVPRTREF,
CVCOMP,
CVVAT,
CVCNTR)

OPTIONS 
   ( skip=1     )
load data
CHARACTERSET UTF8
infile "CustomerRelation.txt"	
truncate into table IMP_CR
fields terminated by "," optionally enclosed by '"'
TRAILING NULLCOLS
(CRTYPE,
CRCOMP,
CRPRTFROM,
CRPRTTO,
CRDTFROM,
CRDTTO,
CRACTION)

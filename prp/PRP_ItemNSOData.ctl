OPTIONS 
   ( skip=1     )
load data
CHARACTERSET UTF8
infile "PRP_ItemNSOData.txt"	
truncate into table IMP_PRP
fields terminated by "," optionally enclosed by '"'
TRAILING NULLCOLS
( PRPCOMP,PRPEXREF,PRPSHPID,PRPVAL, PRPACTION)
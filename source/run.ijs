NB. cal - run
0 :0
Thursday 30 August 2018  19:26:22
-
open BUILTFILE
open '~Gitcal/test/test.ijs'
)

cocurrent 'base'

BUILTFILE_z_=: 1!:1 <jpath'~Gitcal/builtfile'
	NB. …effectively: '~Gitcal/cal.ijs'
TESTFILE_z_=: '~Gitcal/test/test.ijs'
UUFILE_z_=:   '~Gituu/uu.ijs'

NB. ---------------------------------------------------------

load UUFILE  NB. >>> RELOADS _uu_ FROM ITS LAST BUILTFILE

clear 'cal'
load BUILTFILE	
smoutput '--- run.ijs: CAL BUILTFILE loaded: ',BUILTFILE

load TESTFILE
smoutput '--- run.ijs: CAL TESTFILE completed without discrepancies: ',TESTFILE

smoutput tabengine 'Init'
smoutput tabengine 'load 3'  NB. non-trivial asteroid t-table
smoutput tabengine 'sicl 1'
smoutput tabengine 'CTBU'

NB. ---------------------------------------------------------

smoutput 0 : 0
>>> To view existing TPATH_* settings:
  tpath''

>>> To force good working TPATH_* settings:
  load temp ??
)


0 :0
smoutput 'CAL: Init ',tabengine 'Init'
smoutput 'CAL: VERS ',tabengine 'VERS'  NB. VERSION number
smoutput 'CAL: CTBU ',tabengine 'CTBU'
smoutput 'CAL: {1} 100 ',tabengine 'valu 1 100'
-
smoutput OUT_z_=: tabengine IN_z_=: >cutopen 0 :0
VERS
CTBU
addp 1 1
CTBU
)
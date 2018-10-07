NB. cal - run
0 :0
Thursday 30 August 2018  19:26:22
-
open BUILTFILE
open '~Gitcal/test/test.ijs'
)

cocurrent 'base'

BUILTFILE_z_=: '~Gitcal/cal.ijs'
TESTFILE_z_=:  '~Gitcal/test/test.ijs'
UUFILE_z_=:    '~Gituu/uu.ijs'

NB. ---------------------------------------------------------

NB. uloc_z_=: <,'0'  NB. >>>>>>>>>>>>>>>>> FUDGE
load UUFILE  NB. >>> RELOADS _uu_ FROM ITS LAST BUILTFILE

NB. 3 : 0''
NB. if. absent 'uloc_z_' do.
NB.   uuinitTest_uu_''
NB.   smoutput '>>> CAL run: created locator for locale: ',": >uloc_z_
NB. end.
NB. i.0 0
NB. )

clear 'cal'
load BUILTFILE	
smoutput '--- run.ijs: CAL BUILTFILE loaded: ',BUILTFILE

load TESTFILE
smoutput '--- run.ijs: CAL TESTFILE completed without discrepancies: ',TESTFILE

smoutput tabengine 'Init'
smoutput tabengine 'load 3'  NB. non-trivial asteroid t-table
smoutput tabengine 'ssic 1'  NB. set unicode conformance level
smoutput tabengine 'CTBU'    NB. show loaded t-table

NB. ---------------------------------------------------------

NB. smoutput 0 : 0
NB. >>> To view existing TPATH_* settings:
NB.   tpath''
NB.
NB. >>> To force good working TPATH_* settings:
NB.   load temp ??
NB. )

smoutput '+++ Gitcal run: load latest TABBY build...'
load '~Gittab/tabula.ijs'



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
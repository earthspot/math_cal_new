NB. cal - run
0 :0
Sunday 30 December 2018  03:59:52
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

NOPLOT_z_=: 1  NB. disable plot package for j807 builds

smoutput '+++ Gitcal run: load latest TABBY build...'
load '~Gittab/tabula.ijs'

  NB. devt facility for reloading source files…
onload_z_=: do

0 :0
smoutput 'CAL: Init ',tabengine_cal_ 'Init'
smoutput 'CAL: VERS ',tabengine_cal_ 'VERS'  NB. VERSION number
smoutput 'CAL: CTBU ',tabengine_cal_ 'CTBU'
smoutput 'CAL: {1} 100 ',tabengine_cal_ 'valu 1 100'
-
smoutput OUT_z_=: tabengine_cal_ IN_z_=: >cutopen 0 :0
VERS
CTBU
addp 1 1
CTBU
)
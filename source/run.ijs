NB. cal - run
0 :0
Sunday 14 April 2019  03:55:40
-
open TESTFILE
open BUILTFILE
)

cocurrent 'base'

BUILTFILE_z_=: '~Gitcal/cal.ijs'
TESTFILE_z_=:  '~Gitcal/test/test.ijs'
UUFILE_z_=:    '~Gituu/uu.ijs'

NB. ---------------------------------------------------------

NB. uloc_z_=: <,'0'  NB. >>>>>>>>>>>>>>>>> FUDGE
load UUFILE  NB. >>> RELOADS _uu_ FROM ITS LAST BUILTFILE

NB. 3 : 0''
NB. if. NaNoun 'uloc_z_' do.
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

NB. NOPLOT_z_=: if807''  NB. disable plot package for j807 builds

smoutput '+++ Gitcal run: load latest TABBY build...'
load '~Gittab/tabula.ijs'

  NB. devt facility for reloading source files…
onload_z_=: do

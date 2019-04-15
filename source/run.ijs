NB. math_cal_new repo - run
0 :0
Monday 15 April 2019  05:52:02
-
open TESTFILE
open BUILTFILE
)

NB.==================================
GIT=. '~Gitcal'  NB. for DEV
GTB=. '~Gittab'  NB. for DEV
UUFILE_z_=: '~Gituu/uu.ijs'
UULOC=. 'cal'
NB.==================================

cocurrent 'base'

BUILTFILE_z_=: GIT,'/cal.ijs'
TESTFILE_z_=:  GIT,'/test/test.ijs'

NB. ---------------------------------------------------------

load UUFILE  NB. >>> RELOADS _uu_ FROM ITS LAST BUILTFILE

clear UULOC
load BUILTFILE	
smoutput '--- run.ijs: BUILTFILE loaded: ',BUILTFILE

load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without discrepancies: ',TESTFILE

smoutput sw'+++ (GIT) run: load (GTB) latest build...'
load GTB,'/tabula.ijs'

  NB. devt facility for reloading source files…
onload_z_=: do

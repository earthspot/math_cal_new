NB. cal - build
0 :0
Monday 3 September 2018  00:43:58
-
open BUILTFILE
)

NB. TO LOAD JUST THIS BUILTFILE:	fn⌘F9
NB. DITTO THEN RUN:		fnF9

smoutput '--- CAL build: started'

NOW=: date''
HEADERFILE_z_=: '~Gitcal/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath'~Gitcal/builtfile'	NB. '~Gitcal/uu.ijs'

RB=: ')'

  NB. Modify header.ijs with current date written into it
HEADERFILE fappend~ LF,'AABUILT=: ',quote NOW

  NB. build BUILTFILE
writesourcex_jp_ '~Gitcal/source';BUILTFILE

smoutput '--- CAL build: completed'

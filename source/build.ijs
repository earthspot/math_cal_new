NB. cal - build
0 :0
Wednesday 29 August 2018  20:01:14
-
modelled on UU build.ijs
-
open BUILTFILE
)

NB. TO LOAD JUST THIS BUILDFILE:	fn⌘F9	-build only
NB. DITTO + RUN IT AFTERWARDS:	fnF9	-build and run

smoutput '--- CAL build: started'

NOW=: date''
HEADERFILE_z_=: '~Gitcal/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath'~Gitcal/builtfile'	NB. '~Gituu/uu.ijs'

RB=: ')'

  NB. Re-create header.ijs with current date written into it
ferase HEADERFILE
HEADERFILE fappend~ sw 0 :0
0 :0
(NOW)
-
CAL: scientific calculator engine
-
WHY ARE source file headers indented by 1 TAB?
--to make a blank line, else decomment omits entire header line!!
(RB)

clear 'cal'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
coclass 'cal'
AABUILT=: '(NOW)'
)

  NB. build BUILTFILE
writesourcex_jp_ '~Gitcal/source';BUILTFILE

smoutput '--- CAL build: completed'

NB. tpathdev.ijs - defines symbolic paths for CAL
NB. DEVELOPMENT (GitHub) VERSION
0 :0
Saturday 13 April 2019  17:28:58
)

cocurrent 'z'

TPPP=: sort 2}. >cutopen 0 : 0
Name	Owner	Points to…
====	=====	=========
TPAR	CAL 	t-table archive
TPAT	TAB 	patch.ijs
TPCA	TAB 	cal.ijs
TPCL	CAL 	cal_log.txt
TPMC	CAL 	manifest in CAL
TPMT	TAB 	manifest in TABULA
TPMU	UU  	manifest in UU
TPNG	TAB 	toolbar png
TPSA	CAL 	SAMPLE*s (-:TPCA)
TPTA	TAB 	tabula.ijs
TPTT	CAL 	t-table library
TPUC	UU  	uuc.ijs
TPUF	UU  	uuf.ijs
TPUM	UU  	uum.ijs
TPUT	TAB 	usertools.ijs
TPUU	CAL  	uu.ijs
)

TPCA=: jpath'~Gitcal'                  NB. path to CAL build
TPTA=: jpath'~Gittab'                  NB. path to TABULA build
TPUU=: jpath'~Gituu'                   NB. path to UU build
TPMT=: TPTA				NB. manifest in TABULA
TPAT=: TPTA				NB. patch.ijs
TPUT=: TPTA				NB. usertools.ijs
TPNG=: TPTA				NB. toolbar png
TPTT=: jpath'~home/tabula-user'        NB. t-table library
TPAR=: TPTT,'/ttarchive'               NB. t-table archive
TPCL=: jpath'~home'                    NB. cal_log.txt
TPMC=: TPCA                            NB. manifest in CAL
TPMU=: TPUU                            NB. manifest in UU
TPSA=: TPCA                            NB. SAMPLE* t-tables
TPUC=: TPUU                            NB. uuc.ijs
TPUF=: TPUU                            NB. uuf.ijs
TPUM=: TPUU                            NB. uum.ijs

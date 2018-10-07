	NB. cal - public.ijs
'==================== [cal] public ===================='

cocurrent 'cal'

tabengine_z_=: tabengine_cal_

uuconnect=: 3 : 0
  NB. setup the verbs that need to call into UU
NB. uun=: uuinit_uu_''  NB. CAL's locator to its UU instance
uun=: '' conew 'uu'
uuengine=: uuengine__uun  NB. do everything through this keyhole?
  NB. ...NO. Work with individual localizations first…
compat		=: compatible__uun
compatlist	=: compatlist__uun
convert		=: convert__uun
cnvj		=: cnvj__uun
format		=: format__uun
NB. scino 		=: scino__uun	NB. NOTUSED?
selfcanc		=: selfcanc__uun
NB. set_ucase		=: set_ucase__uun	NB. NOTUSED?
NB. sic		=: sic__uun	NB. NOTUSED
NB. sci		=: sci__uun	NB. defined but not used
udat		=: udat__uun
udiv		=: udiv__uun
udumb		=: udumb__uun
uniform		=: uniform__uun
NB. uurowsc		=: uurowsc__uun	NB. NOTUSED?
NB. uurowsf		=: uurowsf__uun	NB. NOTUSED?
NB. uunicode=: sic  NB. >>> HERITAGE! -was only used inside t-table scripts
i.0 0
)

0 :0
--- uuengine instructions: see ~Gituu/source/
adj		adju	NOT DONE
compat		cpat
compatlist	cpli
convert		conv
cnvj		cnvj
format		fmat
scino		scin
selfcanc		slfc
set_ucase		setu
sci		QSCI
udat		udat
udiv		udiv
udumb		udum
uurowsc		uroc
uurowsf		urof
)

0 :0
CAL used to need: ucode and ucods
but currently…
  ucode is unused
  ucods is called only by ct0_cal_
  ct_cal_=: ct1_cal_
-
---USE OF PUBLIC WORDS BY CAL Sunday 2 September 2018...
compatible	incompat(combine) compat compat_i
compatlist	docompatlist compare incompat(combine) compat compat_i
convert		changeunits fexp1 fexp_nominal ttadl ttafl ttappend ttload
cnvj (cnvCunit)	scaleunits
format (formatOUT)	nfx
scino		NOTUSED
selfcanc		combine
setsci (sci)	NOTUSED	
set_ucase		NOTUSED
startuu		NOTUSED
ucase		NOTUSED …is TABULA accessing UU directly?
udat		ttauc ttauf
udiv		combine fnline
udumb		ttauc
uniform		ct1 docompatlist
uurowsc		NOTUSED
uurowsf		NOTUSED
UUC_uu_		califace[VUUC]
UUF_uu_		califace[VUUF]
ucods_uu_		NOTUSED
adj (placeholder)	getvalue setvalue
  getvalue	califace[VALU] plotv
  setvalue	califace[...] plotxSwift plotx plotz setvunits
---TO DO:
	suffix all these with: _uu ?
	elim NOTUSED from UU
	elim direct use of _uu_
	see if any can be avoided
	consider a keyhole: uuengine (adverb if any dyadic)
	restore adj_uu_ -but base it on format*
)

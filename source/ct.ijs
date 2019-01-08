	NB. cal - ct.ijs
'==================== [cal] ct.ijs ===================='
NB. ct=="see t-table" -generates display layout for the t-table
NB. IAC Tuesday 9 October 2018  04:00:35
NB. DON'T USE ct1 --won't work because nfx has been withdrawn.

cocurrent 'cal'

ct1=: 3 : 0
NB. EXISTING ct as distributed (VERSION=: '1.1.00') pre: September 2018
  NB. 1 e. y -include SI units column
  NB. 3 e. y -include box-drawn arrows
  NB. 4 e. y -include "line 0" col-headers
if. 0=#y do. y=. ,3 end.  NB. the default display
  NB. returns "no t-table" message if none has been loaded
if. NaNoun'CAPT' do. ,:40 message'' return. end.
if. 1=#items'' do. ,:CAPT return. end.   NB. trivial display if no items
d=. ] ; $ ; datatype
uc=. uucp"1
d sp=. uc SP $~ 1,~#items''  NB. 1-char wide column spacer
d st=. uc ST $~ 1,~#items''  NB. 1-char wide column of stars
d vd=. uc SP $~ 0,~#items''  NB. 0-char wide empty column placeholder
d arrw=. unis=. fact=. star=. vd  NB. void columns
d lnos=. uc >brace each ":each items''  NB. line numbers
d hold=. uc (HOLD fl vhold)  NB. marks "holds"
d altd=. uc ('@'fl CH)  NB. marks altered values
	d quan=. uc UNITN nfx vquan
d unin=. sp ,. > (uc&uniform) each UNITN  NB. nominal units
if. 1 e. y do.
  d unis=. sp ,. > (uc&uniform) each UNITS  NB. SI-units figures
	  d fact=. uc 'j'nfx vfact
  d star=. uc sp ,.st
end.
if. 3 e. y do.
  d arrw=. uc arrowch arrowgen''
  if. mt arrw do. arrw=. vd else. arrw=. arrw ,. sp end.
    NB. arrw comes with its own spacer
end.
d uttn=. sp ,.sp ,.uc TTn
NB. z=. arrw ,.lnos ,.hold ,.altd ,.quan ,.unin ,.unis ,.star ,.fact ,.sp ,. uc TTn
z=. 'arrw lnos hold altd quan unin unis star fact uttn'
d z=. ". z rplc SP;',.'
if. -. 4 e. y do. z=. }.z end.  NB. drop line {0}
z=. z ,~ CAPT
if. mt z do. z=. 1 1$SP end.  NB. to force panel-clear if void display
z=. (-.vhidd) # z  NB. remove hidden lines
)

NB. nfx=: ''&$: : (4 : 0)
NB.   NB. format numbers y into col using formats: x
NB. f=. (#y)$ boxopen x  NB. formats for each element of y
NB. z=. i.0 0
NB. for_i. i.#y do.
NB.   z=. z , (>i{f) format__uun i{y
NB. 	NB. use of non-public UU-verb as a method
NB. 	NB. -permitted ONLY for a non-operational verb like nfx.
NB. end.
NB. pad rjust z
NB. )


NB. ------------------------------------------------------------------
  NB. NEW ct -- ignores its y-arg, returns "unicode" table
  NB.  CAL instruction CTAB returns ct output unaltered,
  NB.  CAL instruction CTBU returns (lit) utf-8 LF-separated string.
  NB. Some work-nouns will be redundant in distributed version
ct2=: 3 : 0
  NB. y is diagnostic mode: y=='' for operational use
  NB. returns "no t-table" message if no t-table loaded…
if. NaNoun'CAPT' do. ,:40 message'' return. end.
  NB. If no items return trivial display of just CAPT
if. 2>nn=. #ii=. items'' do. ,:CAPT return. end.
wc=. uucp"1                       NB. (string) y as wc chars
fmt=. ":"0                        NB. simple format for v-caches
ufmt=. [: wc&uniform"1 >          NB. SI-compliant unicode for UNIT*
SEP1=. '|' $~ nn,2                NB. column-separator
SEP2=. ' * ' $~ nn,3              NB. column-separator
SEP3=. ' = ' $~ nn,3              NB. column-separator
arrw=. wc arrowch arrowgen''      NB.0 wcchar array of arrows
lnos=. >brace each ii             NB.0 braced line nos
hold=. HOLD fl vhold              NB.0 vhold as col of HOLD symbols
altd=. ALTERED fl CH              NB.0 CH as col of ALTERED symbols
sicn=. ufmt UNITN                 NB. SI-levelled col of nominal units
sics=. ufmt UNITS                 NB. SI-levelled col of SI-units
fact=. rjust fmt vfact            NB.0 col of factors
quan=. rjust fmt vquan            NB.0 col of nominal values
siqn=. rjust fmt vsiqn            NB.0 col of SI-values
un=. >UNITN                       NB.0 nominal units (x-arg for uu)
us=. >UNITS                       NB.0 col of SI-units
uuqy=. siqn ,.SP ,.us             NB.0 SI-qty (y-arg for uu)
qtys=. mjust wc un uu__uun uuqy   NB.0 qtys using un&uu
  NB. NB.0 are the only nouns needed for (default) x=0
  NB. consider not assigning the others to reduce execution time
 lin0=. sw' +++ (CAPT) in diagnostic mode y=(y)'
select. y
case. 0 do.  NB. simply-formatted v-caches
 lin0=. sw'y=(y)       lnos       fact       quan     siqn sics'
 z=. arrw ,.lnos ,.hold ,.altd ,.fact ,.SP ,.quan ,.SP ,.siqn ,.SP ,.sics
case. 1 do.  NB. (quan) x(un) y(uuqy) -args for uu -->(qtys)
 lin0=. sw'y=(y)       lnos ------quan un-- ----uuqy-----  -----qtys--------'
 z=. arrw ,.lnos ,.SP ,.quan ,.SP ,.un ,.SP ,.uuqy ,.SP ,.qtys
case. 2 do.  NB. c/f 1 but different arrangement
 lin0=. sw'y=(y)       lnos       qtys        ||      quan un        siqn us'
 z=. arrw ,.lnos ,.hold ,.altd ,.qtys ,.SEP1 ,.quan ,.SP ,.un ,.SP ,.siqn ,.SP ,.us
case.   do.  NB. OPERATIONAL USE
 lin0=. CAPT
 z=. arrw ,.lnos ,.hold ,.altd ,.SP ,.qtys ,.SP ,.SP ,.TTn
end.
lin0 , z #~ force0 -.vhidd        NB. remove hidden lines ALSO {0}
)

ct=: ct2		NB. USE NEW ct <<<<<<<<<<<<<<<<<<

NB. smoutput ct2 2
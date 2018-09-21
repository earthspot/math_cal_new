	NB. cal - ct.ijs
'==================== [cal] ct.ijs ===================='
NB. ct=="see t-table" -generates display layout for the t-table
NB. IAC Thursday 20 September 2018  23:36:03

cocurrent 'cal'

ct1=: 3 : 0
NB. EXISTING ct as distributed (VERSION=: '1.1.00') pre: September 2018
  NB. 1 e. y -include SI units column
  NB. 3 e. y -include box-drawn arrows
  NB. 4 e. y -include "line 0" col-headers
if. 0=#y do. y=. ,3 end.  NB. the default display
  NB. returns "no t-table" message if none has been loaded
if. absent'CAPT' do. ,:40 message'' return. end.
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

NB. ------------------------------------------------------------------
  NB. NEW ct -- ignores its y-arg, returns "unicode" table
  NB.  CAL instruction CTAB returns this verb's output unaltered,
  NB.  CAL instruction CTBU returns (lit) utf-8 LF-separated string.
  NB. Some work-nouns will be redundant in distributed version
  NB. "kosher" here means no fancy unicoded chars, only ascii forms
  NB. (kosher is the internal working data format for UU)
ct2=: 3 : 0
  NB. returns "no t-table" message if no t-table loaded…
if. absent'CAPT' do. ,:40 message'' return. end.
  NB. If no items return trivial display of just CAPT
if. 2>nn=. #ii=. items'' do. ,:CAPT return. end.
uc=. uucp"1
sp2s=.  SP $~ nn,2                NB. column-separator
bars=. '|' $~ nn,2                NB. column-separator
stas=. ' * ' $~ nn,3              NB. column-separator
equs=. ' = ' $~ nn,3              NB. column-separator
arrw=. uc arrowch arrowgen''      NB. widechar array of arrows
lnos=. >brace each ii             NB. braced line nos
hold=. HOLD fl vhold              NB. vhold as col of HOLD symbols
altd=. ALTERED fl CH              NB. CH as col of ALTERED symbols
knin=. >UNITN                     NB. kosher col of nominal units
unin=. > (uc&uniform) each UNITN  NB. SI-conformed col of nominal units
knis=. >UNITS                     NB. kosher col of SI-units
unis=. > (uc&uniform) each UNITS  NB. SI-conformed col of SI-units
  NB. …can we assume UNITN and UNITS are always kosher? <<<<<<<<<<<<<<
qtys=. (UNITN nfx vquan) ,. SP ,. unin  NB. "quantities" col
  NB. qtys is the one to replace with uu-generated strings
NB. fact=. 'j'nfx vfact           NB. WTF is 'j' format ??? <<<<<<
siqn=. >": each vsiqn
ksis=. siqn ,. SP ,. knis         NB. kosher y-arg for uu
qty2=. mjust uc knin&uu__uun ksis NB. qtys using knin&uu
uttn=. >TTn                       NB. …is TTn always 'unicode'? <<<<<<
select. DIAGNOSTICS
case. 0 do.  NB. FOR OPERATIONAL USE
 z=. arrw ,.lnos ,.hold ,.altd ,.SP ,.qty2 ,.sp2s ,.uttn
case. 1 do.  NB. old "quantities" col, include SI-form of data
 z=. arrw ,.lnos ,.hold ,.altd ,.qtys ,.stas ,.siqn ,.SP ,.unis
case. 2 do.  NB. old "quantities" col, include kosher SI-data 
 z=. arrw ,.lnos ,.hold ,.altd ,.qtys ,.bars ,.knin ,.stas ,.ksis
case. 3 do.  NB.  ==2 using qty2 based on uu
 z=. arrw ,.lnos ,.hold ,.altd ,.qty2 ,.bars ,.knin ,.stas ,.ksis
case. 4 do.  NB.  qty2 c/f qtys
 z=. arrw ,.lnos ,.hold ,.altd ,.qty2 ,.equs ,.qtys
end.
if. 0=DIAGNOSTICS do. lin0=. CAPT
else. lin0=. sw' (CAPT) with: DIAGNOSTICS=(DIAGNOSTICS)' end.
lin0 , z #~ force0 -.vhidd        NB. remove hidden lines ALSO {0}
)

DIAGNOSTICS=: 0
ct=: ct2		NB. USE NEW ct <<<<<<<<<<<<<<<<<<

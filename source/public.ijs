	NB. cal - public.ijs
'==================== [cal] public ===================='

cocurrent 'cal'

uuconnect=: 3 : 0
  NB. setup the verbs that need to call into UU
NB. uun=: uuinit_uu_''  NB. CAL's locator to its UU instance
uun=: '' conew 'uu'
uuengine=: uuengine__uun  NB. do everything through this keyhole?
  NB. ...NO. Work with individual localizations first…
format		=: format__uun
NB. compat		=: compatible__uun
NB. compatlist	=: compatlist__uun
NB. convert		=: convert__uun
NB. cnvj		=: cnvj__uun
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
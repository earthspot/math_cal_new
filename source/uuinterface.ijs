'==================== cal uuinterface.ijs ===================='
NB. IAC Wed 1 Jul 2015  09:04:42

cocurrent 'cal'

NB. INTERFACE WITH THE SCIENTIFIC UNITS ADDON: math/uu
NB.
NB. All verbs used by math/tabula from math/uu are shown below.
NB. All such verbs are covered by aliases in locale _tab_
NB. Therefore, _uu_ should not appear anywhere else
NB.  in the source code of this project: math/tabula.

NB. NOTE:
NB. start_uu_ (alias startuu_tab_) is called by
NB. the script of math/uu itself when it is first loaded.
NB. Therefore start_tab_ (see [qt] start.ijs) does not need
NB. to call it.
NB. However handler: restart_tab_ DOES need to call it,
NB. which is why startuu is provided below for this purpose.

adj=: adj_uu_
compat=: compatible_uu_
compatlist=: compatlist_uu_
convert=: convert_uu_
cnvj=: cnvj_uu_
format=: format_uu_
scino=: scino_uu_
selfcanc=: selfcanc_uu_
setsci=: setsci_uu_
setsig=: setsig_uu_
set_ucase=: set_ucase_uu_
sci=: sci_uu_
sig=: sig_uu_
startuu=: start_uu_
ucode=: ucode_uu_
ucods=: ucods_uu_
udat=: udat_uu_
udiv=: udiv_uu_
udumb=: udumb_uu_
uurowsc=: uurowsc_uu_
uurowsf=: uurowsf_uu_

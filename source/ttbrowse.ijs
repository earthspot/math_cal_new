	NB. cal - ttbrowse
0 :0
Wednesday 5 December 2018  02:55:13
-
ttb_pane_select -called when a line clicked
Tool: opent - ⌘click opens ttbrowse
ttb_bnLoad_button -"illegal" calls into TABBY
  really needs to send a message which can be ignored.
  -or maybe a try/catch ??
-
onload_z_=: do
-
wd 'psel ttb; qform;'  NB. for adjusting: POS below
)

coclass 'ttb'
clear 'ttb'

UNSET=: '<UNSET>'
path=: UNSET
NB. POS=: 480 23 800 400
POS=: 322 23 1060 400

'nix shf cmd opt'=: 0 1 2 4  NB. used by: ttb_pane_button

TTBFORM=: 0 : 0
pc ttb;pn ttbrowse;
bin v;
bin h;
cc textbuf editm;
cc infobuf editm;
cc pane listbox;
bin z;
bin h;
bin s;		rem left spacer;
  cc bnDele button; cn "Delete";
  cc bnOpen button; cn "Open";
  cc bnLoad button; cn "Load";
bin s;		rem right spacer;
bin z;
cc sbar static; cn "status";
bin z;
set textbuf font fixfont;
pshow;
)
NB. <<< cc sbar static MUST be followed by cn "…"; else no-workee

directory=: 3 : 0
  NB. 6-col boxed array of "ls -l" info
  NB. 1st col is filenames
1!:0 jpath TPATH_TTABLES_cal_,'*.ijs'
)

content=: 3 : 0
  NB. LF-sep list of filenames in directory''
x2f >{."1 directory''
)

deTAB=: 3 : 0
  NB. replace TAB by SP
dtb y charsub~ TAB,SP
)

window_close=: 3 : 0
wd :: empty 'psel ttb; pclose;'
)

refreshPane=: 3 : 0
wd 'set pane items *',content''
)

start=: 3 : 0
window_close''
wd TTBFORM
refreshPane''
wd 'psel ttb; pmove ' , ":POS
putsb 'started: ',date''
)

putsb=: 3 : 0
  NB. show (string/num) y in statusbar
wd 'psel ttb; set sbar text *',":,y
)

ttb_bnDele_button=: 3 : 0
  NB. Delete
smoutput 'deletefile_cal_ ',quote path
)

ttb_bnOpen_button=: 3 : 0
  NB. Open
open path
)

ttb_bnLoad_button=: 3 : 0
  NB. Load
try.
  tabenginex_tabby_ 'load' ; path
  setFormTitle_tabby_''
catch. smoutput '>>> ttb_bnLoad_button: illegal call into _tabby_'
end.
)

ttb_close=: window_close

ttb_default=: 3 : 0
  NB. warns of a missing handler
smoutput '>>> missing handler: ',sysevent
NB. sllog 'ttb_default sysevent syschild pane_select'
)

ttb_resize=: empty

ttb_pane_select=: 3 : 0
  NB. examine selected t-table
if. shf= {. ". sysmodifiers do. refreshPane'' end.
NB. sllog 'ttb_pane_select sysmodifiers pane_select'
]path=: TPATH_TTABLES_cal_,pane
text=: info=: UNSET
text=: read path
erase 'TT TTIMAGE TTINFO vquan vfact'
load :: 0: path  NB. creates: TT, TTIMAGE (vquan, vfact
if. -.absent'TTIMAGE' do. text=: TTIMAGE end.
if. -.absent'TTINFO' do. info=: TTINFO end.
wd 'psel ttb; set textbuf text *',text
wd 'psel ttb; set infobuf text *',info
putsb 'ttb_pane_select: ',date''
)

numvec=: 3 : '". (LF,SP) sub y'
sub=: ' _'&$: :(4 : '({:x) (I.y={.x) } y')

onload 'start_ttb_ 0'
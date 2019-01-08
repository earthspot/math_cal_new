	NB. cal - ttbrowse
0 :0
Wednesday 2 January 2019  00:58:55
-
ttb_pane_select -called when a line clicked
Tool: opent - ⌘click opens ttbrowse
ttb_bnLoad_button -"illegal" calls into TABBY
  instead really needs to send a message which can be ignored.
  -or maybe a try/catch ??
-
expand pfx to use the current tag of (path) y
Omit the '.ijs' from displayed (content'')
-
onload_z_=: do
-
wd 'psel ttb; qform;'  NB. for adjusting POS below
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
  cc bnTag0 button; cn "No Tags";
  cc bnTag1 button; cn "Tag[1]";
  cc bnTag2 button; cn "Tag[2]";
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

TAG1=: 0 : 0	NB. red
62 70 6C 69 73 74 30 30 A1 01 55 52 65 64 0A 36
08 0A 00 00 00 00 00 00 01 01 00 00 00 00 00 00
00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 10
)

TAG2=: 0 : 0	NB. green
62 70 6C 69 73 74 30 30 A1 01 57 47 72 65 65 6E
0A 32 08 0A 00 00 00 00 00 00 01 01 00 00 00 00
00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 12
)

tagpath=: (''ddefine) :: 0:
  NB. tag the current file (y) with tag id (x)
if. 0=#y do. y=. path end.  NB. for when called as button handler
f0=. 2!:0  NB. waits
f1=. 2!:1  NB. no wait
NB. f0=.f1=. smoutput
hx=. deb (LF;SP)stringreplace ". 'TAG',":x
p=. jpath y
com=. 'com.apple.metadata:_kMDItemUserTags'
if. p-:UNSET do. return. end.
select. x
case. 0 do. f0 sw'xattr -d (com) (p)' NB. delete tag
case. 1 do. f0 sw'xattr -wx (com) "(hx)" (p)' NB. tag red
case. 2 do. f0 sw'xattr -wx (com) "(hx)" (p)' NB. tag green
end.
  NB. This block will not be entered if any phrase fails,
  NB. but instead (::) will ensure 0 is returned.
NB. ssw '... query tag…'
select. f0 sw'xattr -px (com) (p)' NB. query tag
case. TAG1 do. 1 return.
case. TAG2 do. 2 return.
case.      do. 0
end.
)

pfx=: 3 : 0"1
	y return.
t=. {. ": tagpath '~Ttables/',deb y
NB. ssw '+++ pfx: t=(t) y=(y)'
NB. wd'msgs'
t,UL,y
)
  
directory=: 3 : 0
  NB. 6-col boxed array of "ls -l" info
  NB. 1st col is filenames
DIR=: 1!:0 jpath '~Ttables/*.ijs'
)

pathtable=: 3 : 0
  NB. mx of PREFIXED filenames in directory''
pfx >{."1 directory''
)

NB. content=: 3 : 0
NB.   NB. LF-sep list of filenames in directory''
NB. x2f >{."1 directory''
NB. )

content=: 3 : 0
  NB. LF-sep list of filenames in directory''
x2f pathtable''
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
  NB. Delete t-table
smoutput 'deletefile_cal_ ',quote path
)

ttb_bnOpen_button=: 3 : 0
  NB. Open t-table as jscript
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
NB. fname=: 2}.pane
fname=: pane	NB. WITH TRIVIAL pfx <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
path=: jpath '~Ttables/',fname
tagid=. tagpath path
tag=. > tagid { ;:'notag red green'
text=: info=: UNSET
text=: read path
erase 'TT TTIMAGE TTINFO vquan vfact'
load :: 0: path  NB. creates: TT, TTIMAGE (vquan, vfact
if. -.NaNoun'TTIMAGE' do. text=: TTIMAGE end.
if. -.NaNoun'TTINFO' do. info=: TTINFO end.
wd 'psel ttb; set textbuf text *',text
wd 'psel ttb; set infobuf text *',info
putsb tag,' / ttb_pane_select: ',date''
)

numvec=: 3 : '". (LF,SP) sub y'
sub=: ' _'&$: :(4 : '({:x) (I.y={.x) } y')

ttb_bnTag0_button=: 0&tagpath
ttb_bnTag1_button=: 1&tagpath
ttb_bnTag2_button=: 2&tagpath

NB. tagpath=: 3 : 0
NB.   NB. tag the current t-table
NB. ssw '+++ tagpath[(y)]: t-table=(path)'
NB. if. path-:UNSET do. return. end.
NB. select. y
NB. case. 0 do. ssw'... delete all tags'
NB. case. 1 do. ssw'... tag red'
NB. case. 2 do. ssw'... tag green'
NB. end.
NB. )

onload 'start 0'
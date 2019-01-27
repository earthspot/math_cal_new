	NB. cal - ttbrowse
0 :0
Saturday 26 January 2019  22:44:28
-
old version cloned: tempuu 71
-
onload_z_=: do
wd 'psel ttb; qform;'  NB. for adjusting POS below
)

coclass 'ttb'
clear 'ttb'

UNSET=: '<UNSET>'
path=: UNSET
TAG0=: <,''
POS=: 322 23 830 400

0 :0
ttb_default=: 3 : 0
  NB. warns of a missing handler
smoutput '>>> missing handler: ',sysevent
)

TTBFORM=: 0 : 0
pc ttb;pn ttbrowse;
bin v;
bin h;
cc textbuf editm;
cc infobuf editm;
cc g table;
bin z;
bin hs;
  cc bnDele button; cn "Delete T-table";
  cc bnTag0 button; cn "No Tags";
  cc bnTag1 button; cn "Red";
  cc bnTag2 button; cn "Green";
  cc bnOpen button; cn "Open";
  cc bnLoad button; cn "Load";
bin sz;
cc sbar static; cn "status";
bin z;
set textbuf font fixfont;
pshow;
)
NB. <<< cc sbar static MUST be followed by cn "…"; else no-workee
0 :0 NB. removed from above…
bin s;		rem left spacer;
bin s;		rem right spacer;
  cc bnSorn button; cn "Sort/filename";
  cc bnSord button; cn "Sort/date";
  cc bnSort button; cn "Sort/tag";
)

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

directory=: 3 : 0
  NB. 6-col boxed array of "ls -l" info
  NB. 1st col is filenames
DIR=: 1!:0 jpath '~Ttables/*.ijs'
)

window_close=: 3 : 0
wd :: empty 'psel ttb; pclose;'
)

gRefresh=: 4 : 0
  NB. make table control: g accept boxed table: y
wd 'set g shape ',":shape=: $y
wd 'set g protect ',": , shape$0 1 1  NB. protect all but 1st col
wd 'set g hdr *', x
NB. wd 'set g lab ',o4b labels
wd 'set g data *', ; SP ,each dquote&": each y
NB. wd 'set g background ', o4b (,Tab < 100) { '#ffffff';'#ff8888'
NB. wd 'set g background ', o4b , COLORTABLE {~ y -:"0 <'temp'
wd 'set g resizecol'
)

start=: 3 : 0
window_close''
wd TTBFORM
'TAG FILENAME DATE' gRefresh TAG0 ,"1 (2&{."1) directory''
wd 'psel ttb; pmove ' , ":POS
putsb 'started: ',date''
)

putsb=: 3 : 0
  NB. show (string/num) y in statusbar
wd 'psel ttb; set sbar text *',":,y
)

ttb_bnDele_button=: 3 : 0
  NB. Delete t-table
  NB. INSERT CAUTIONS HERE
ssw 'deletefile_cal_ (quote path) --not yet implemented'
  NB. REFRESH DIR HERE
)

ttb_bnOpen_button=: 3 : 0
  NB. Open t-table as jscript
open path
)

ttb_bnLoad_button=: 3 : 0
  NB. Load the selected t-table into _tabby_
try.
  tabenginex_tabby_ 'load' ; path
  setFormTitle_tabby_''
catch. smoutput '>>> ttb_bnLoad_button: illegal call into _tabby_'
end.
)

ttb_g_mbldbl=: ttb_bnLoad_button  NB. double-click==Load

ttb_bnTag0_button=: 0&tagpath
ttb_bnTag1_button=: 1&tagpath
ttb_bnTag2_button=: 2&tagpath
NB. ttb_bnSord_button=: sortByDate
NB. ttb_bnSorn_button=: sortByName
NB. ttb_bnSort_button=: sortByTag

ttb_close=: window_close

ttb_g_mark=: 3 : 0
  NB. examine selected t-table
select. g  NB. detect click on header row
case. '0 0' do. sortByTag'' return.
case. '0 1' do. sortByName'' return.
case. '0 2' do. sortByDate'' return.
end.
fno=: {.".g
fname=: 0 pick fno{DIR
NB. ssw 'ttb_g_mark: g_select=(g_select) g=(g) fno=(fno) fname=(fname)'
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
putsb tag,' / ttb_g_mark: ',date''
)

heldshift=: 3 : '1=".sysmodifiers'

direction=: 3 : 0
  NB. wd command: sort direction
if. y=heldshift'' do. 'descending' else. 'ascending' end.
)

sortByDate=: 3 : 0
  NB. sort directory (g) by date
wd 'psel ttb; set g sort 2 ',direction 0
)

sortByName=: 3 : 0
  NB. sort directory (g) by name
wd 'psel ttb; set g sort 1 ',direction 1
)

sortByTag=: 3 : 0
  NB. sort directory (g) by tag
wd 'psel ttb; set g sort 0 ',direction 0
)

onload 'start 0'
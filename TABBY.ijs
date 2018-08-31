NB. TABBY -- simple-stupid replacement for TABULA
0 :0
Friday 31 August 2018  11:24:16
-
REFERENCE SOURCES:
op'nuterm'                 NB. for toolbar
open '~Gittab/tabula.ijs'  NB. for TABU & handlers
)

clear 'tabby'
coclass 'tabby'
coinsert 'jgl2'

smoutput 4$LF

TABU=: 0 : 0  NB. copied from: ~Gittab/tabula.ijs
pc tab;pn Tabby;
menupop "File";
menu newtt "&New" "Ctrl+N" "Start a new ttable" "new";
menu opens "Open Sample" "Ctrl+Shift+O" "Open a sample ttable" "sample";
menu opent "&Open..." "Ctrl+O" "Open a ttable from user library" "open...";
menu appet "&Append..." "" "Append a ttable from user library" "append...";
menu savex "&Save" "Ctrl+S" "Save current ttable under existing name" "savex";
menu saves "Save As Sample" "" "Save current ttable as default sample" "saves";
menu savet "Save As Title" "" "Save current ttable under title shown" "savet";
menu savea "Save As..." "" "Save current ttable under new name" "save as...";
menusep;
menu stept "Plot 0 to (value)" "" "plot values" "plot";
menu plotl "Line Chart" "" "Specify plot: line" "line";
menu plotb "Bar Chart" "" "Specify plot: bar" "bar";
menu plotp "Pie Chart" "" "Specify plot: pie" "pie";
menu plots "Surface Chart" "" "Specify plot: surface" "surface";
menusep;
menu close "Close" "" "Close current ttable" "close ttable";
menusep;
menu print "Print" "" "Print current ttable" "print ttable";
menusep;
menu quit "&Quit" "Ctrl+Shift+Q" "Quit TABULA" "quit";
menupopz;
menupop "Edit";
menu undo "&Undo" "Ctrl+U" "Undo last action" "undo";
menu redo "&Redo" "Ctrl+Shift+U" "Redo last action" "redo";
menusep;
menu copal "&Copy Ttable" "Ctrl+Shift+C" "copyall" "copy-all";
menusep;
menu label "Edit Item Name" "Ctrl+Shift+N" "Edit name" "name";
menu formu "Edit Formula" "Ctrl+Shift+F" "Edit formula" "formula";
menu erasf "Erase Formula" "" "Erase formula..." "no formula";
menu siunt "Convert to SI Units" "Ctrl+Shift+S" "Convert line to SI units..." "SI units";
menusep;
menu movit "Move Line Down" "Ctrl+K" "Move this line down" "movedown";
menu mvitu "Move Line Up" "Ctrl+J" "Move this line up" "moveup";
menusep;
menu newsl "New Line" "Ctrl+L" "Make a new line" "newline";
menu merge "Merge lines" "Ctrl+M" "Merge lines..." "merge";
menu delit "Delete Line" "" "Delete this line" "delete";
menu dupit "Duplicate Line" "Ctrl+D" "Duplicate this line" "dup";
menusep;
menu updex "Update Exchange Rates" "" "Update currency exchange rates for this ttable" "upd-exch";
menu updin "Update Info" "" "Update info for this ttable" "upd-inf";
rem menusep;
rem menu stup "Startup with TABULA" "" "Fix startup" "stup";
menupopz;
menupop "Command";
menu repet "Repeat" "Ctrl+Shift+R" "Repeat last action" "repeat";
menusep;
menu tthld "Toggle Transient Hold" "Ctrl+Shift+G" "Transient hold" "hold";
menu thold "Toggle Hold" "Ctrl+Shift+H" "Toggle hold" "hold!";
menusep;
menu hidel "Hide Line(s)" "" "Hide selected lines" "hide";
menu unhid "Unhide All Lines" "" "Unhide all hidden lines" "unhide";
menusep;
menu ttabl "Show Ttable" "Ctrl+T" "Show ttable display" "ttable";
menu conss "Show Constants List" "" "Show consts tab" "consts";
menu funcs "Show Functions List" "" "Show functs tab" "functs";
menu infor "Show Ttable Info" "Ctrl+I" "Show info tab" "info";
menusep;
menu trace "Toggle TRACE" "Ctrl+Shift+T" "Toggle trace" "trace";
menu trach "Toggle TRACH" "" "Toggle Handler1 trace" "handler";
menu traci "Toggle cal echo" "" "Toggle echo" "traci";
menupopz;
menupop "Value";
menu Vzero "Zero" "Ctrl+0" "Zero the value" "zero";
menu Vonep "One" "Ctrl+1" "Set the value to 1" "+1";
menu Vonen "Minus One" "" "Set the value to -1" "-1";
menusep;
menu Vabsv "Abs" "" "Absolute Value" "abs";
menu Vdblv "Double" "" "Value doubled" "doubled";
menu Vhlvv "Halve" "" "Value halved" "halved";
menu Vintv "Integer" "" "Value integer" "int";
menu Vinvv "Invert" "" "Value inverted" "inverted";
menu Vnegv "Negate" "" "Value negated" "negated";
menusep;
menu Vsqtv "Sq Root" "" "Value sq-rooted" "sqrt";
menu Vsqrv "Square" "" "Value squared" "squared";
menu Vcbtv "Cube Root" "" "Value cube-rooted" "cubed";
menu Vcubv "Cube" "" "Value cubed" "cubed";
menu Vexpv "Exp" "" "e^value" "exp";
menu Vextv "10^" "" "10^value" "exp";
menu Vetwv "2^" "" "2^value" "exp";
menu Vlnnv "Ln" "" "Value natural-log" "ln";
menu Vltnv "Log10" "" "Value log10" "log10";
menu Vltwv "Log2" "" "Value log2" "log2";
menusep;
menu Vpimv "Times-π" "" "Value times π" "*π";
menu Vptmv "Times-2π" "" "Value times 2π" "*2π";
menu Vpidv "By-π" "" "Value divided by π" "/π";
menu Vptdv "By-2π" "" "Value divided by 2π" "/2π";
menupopz;
menupop "Scale";
menu Vunsc "Unscaled"  "" "Unscaled" "unscaled";
menu Vstpu "Step Up"  "" "Step Up" "stepup";
menu Vstpd "Step Down"  "" "Step Down" "stepdown";
menusep;
menu Vdeci "deci-  [/10]"  "" "Divided by 10" "deci";
menu Vcent "centi- [/100]" "" "Divided by 100" "centi";
menu Vmill "milli- [/1000]" "" "Divided by 10^3" "milli";
menu Vmicr "micro- [/10^6]" "" "Divided by 10^6" "micro";
menu Vnano "nano-  [/10^9]"  "" "Divided by 10^9" "nano";
menu Vpico "pico-  [/10^12]"  "" "Divided by 10^12" "pico";
menu Vfemt "femto- [/10^15]" "" "Divided by 10^15" "femto";
menu Vatto "atto-  [/10^18]"  "" "Divided by 10^18" "atto";
menu Vzept "zepto- [/10^21]" "" "Divided by 10^21" "zepto";
menu Vyoct "yocto- [/10^24]" "" "Divided by 10^24" "yocto";
menusep;
menu Vdeca "deca-  [*10]"  "" "Multiplied by 10" "deca";
menu Vhect "hecto- [*100]" "" "Multiplied by 100" "hecto";
menu Vkilo "kilo-  [*1000]" "" "Multiplied by 10^3" "kilo";
menu Vmega "mega-  [*10^6]" "" "Multiplied by 10^6" "mega";
menu Vgiga "giga-  [*10^9]" "" "Multiplied by 10^9" "giga";
menu Vtera "tera-  [*10^12]" "" "Multiplied by 10^12" "tera";
menu Vpeta "peta-  [*10^15]" "" "Multiplied by 10^15" "peta";
menu Vexaa "exa-   [*10^18]"  "" "Multiplied by 10^18" "exa";
menu Vzett "zetta- [*10^21]" "" "Multiplied by 10^21" "zetta";
menu Vyott "yotta- [*10^24]" "" "Multiplied by 10^24" "yotta";
menupopz;
menupop "Function";
menu additems "Add Lines" "" "Add lines" "add";
menu subitems "Subtract Lines" "" "Subtract lines" "subtract";
menu mulitems "Multiply Lines" "" "Multiply lines" "multiply";
menu divitems "Divide Lines" "" "Divide lines" "divide";
menu powitems "Power Lines" "" "Power lines" "power";
menusep;
menu Lequl "Equal Line" "Ctrl+E" "Append equal line" "equal";
menu Labsl "Abs Line" "" "Append abs-value line" "abs";
menu Ldbll "Doubled Line" "" "Append doubled line" "doubled";
menu Lhlvl "Halved Line" "" "Append halved line" "halved";
menu Lintl "Integer Line" "" "Append integer-value line" "int";
menu Linvl "Inverted Line" "" "Append inverted line" "inverted";
menu Lnegl "Negated Line" "" "Append negated line" "negated";
menusep;
menu Lsqtl "Sq Root Line" "" "Append square-rooted line" "sqrt";
menu Lsqrl "Squared Line" "" "Append squared line" "squared";
menu Lcbtl "Cube Root Line" "" "Append cube-rooted line" "cubert";
menu Lcubl "Cubed Line" "" "Append cubed line" "cubed";
menu Lexpl "Exp Line" "" "Append exponential line" "exp";
menu Lextl "10^ Line" "" "Append 10^ line" "exp";
menu Letwl "2^ Line" "" "Append 2^ line" "exp";
menu Llnnl "Ln Line" "" "Append natural-log line" "ln";
menu Lltnl "Log-10 Line" "" "Append log-10 line" "log";
menu Lltwl "Log-2 Line" "" "Append log-10 line" "log";
menusep;
menu Lpiml "Times-π Line" "" "Append line times π" "*π";
menu Lptml "Times-2π Line" "" "Append line times 2π" "*2π";
menu Lpidl "By-π Line" "" "Append line divided by π" "/π";
menu Lptdl "By-2π Line" "" "Append line divided by 2π" "/2π";
menusep;
menu Lt1ml "Times-10 Line" "" "Append line times 10" "*10";
menu Lt2ml "Times-100 Line" "" "Append line times 100" "*100";
menu Lt3ml "Times-1000 Line" "" "Append line times 1000" "*1000";
menu Lt1dl "By-10 Line" "" "Append line divided by 10" "/10";
menu Lt2dl "By-100 Line" "" "Append line divided by 100" "/100";
menu Lt3dl "By-1000 Line" "" "Append line divided by 1000" "/1000";
menupopz;
menupop "Help";
menu hlpt "Help for TABULA" "" "TABULA help" "help";
menu hlpc "Help for 1-char comands" "" "cmds help" "cmds";
menu hinf "Info for this ttable" "" "ttable info" "info";
menupopz;
cc g isidraw;
cc tabs tab;
tabnew T-table;
bin h;
cc preci combobox;
cc calco edit;
cc xunit combobox;
bin z;
cc panel listbox multiple;
tabnew Constants;
cc cons listbox;
bin h;
cc cappend button;cn "Append";
cc searchc edit;
cc casec checkbox;cn "case-sensitive";
bin z;
tabnew Functions;
cc func listbox;
bin h;
cc fappend button;cn "Append";
cc searchf edit;
cc casef checkbox;cn "case-sensitive";
bin z;
tabnew Info;
cc info editm;
bin h;
cc updin button;cn "Update";
bin s1z;
tabend;
cc sbar statusbar;
set sbar addlabel status;
set sbar addlabelp sinf1;
set sbar addlabelp sinf2;
)

start=: 3 : 0
wd 'timer 0'
tab_open''
fillttable''
)

XYWH=: 1500 22 536 450

tab_open=: 3 : 0
window_close''
TABNDX=: 0
wd TABU
wd 'psel tab'
wd 'pmove ' , ":XYWH
wd 'set g wh _1 64'
wd 'set info text *' , tabengine 'INFO'
NB. try.
NB.   t=. uurowsc searchc
NB.   assert. 2=#$t	NB. therefore must use x2f with wd 'set…'
NB. catch.
  t=. ,:UNSET
NB. end.
wd 'set cons font fixfont'
wd 'set cons items *',x2f t
NB. try.
NB.   t=. uurowsf searchf
NB. catch.
NB.   t=. ,:UNSET
NB. end.
wd 'set func font fixfont'
wd 'set func items *',x2f t
wd 'set preci items *', o2f ": i.16
wd 'set panel font fixfont'
wd 'set panel items *',UNSET
confirm 'Click a line and perform some operation on it...'
wd 'pshow'
fill_tools ''
)

window_close=: 3 : 0
wd :: EMPTY 'psel tab; pclose;'
)

PNG=: temp 'tabula-toolbar.png'

clear_tools=: 3 : 0
glsel 'g'
glclear''
)

fill_tools=: 0 ddefine
  NB. redraws toolbar, hilites tool id= y
  NB. (bool) x controls hilite color
glsel 'g'
NB. glclear''
a=. readimg_jqtide_ PNG
glpixels 0 0 , (|.$a), ,a
if. {. y e. i.32 do.
  x circle (512 | 16 + 32*y) , (16 + 32*y>15)
end.
glpaint''
)

circle=: 4 : 0
  NB. draw circle of DIAMETER centred at (px coords) y
clicked=. x  NB. (bool) x-arg of caller: fill_tools
ring=. clicked pick COLOR_HOVER ; COLOR_CLICK
NB. ring=. COLOR_WHITE
NB. spot=. clicked pick COLOR_HOVER ; COLOR_CLICK
glsel 'g'
glpen PEN_WIDTH [glrgb ring
NB. glbrush'' [glrgb spot  NB. next ellipse filled with spot color
xy=. y
wh=. 2#DIAMETER
radius=. <.DIAMETER%2
glellipse (xy - radius) , wh
)

PEN_WIDTH=: 3
COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
COLOR_CLICK=: COLOR_WHITE
DIAMETER=: 30

tabengine=: 3 : 0
  NB. dummy simulator replaced by tabengine_cal_
select. 4{.y
case. 'Init' do. TABENGINE_RESPONSE_Init
case. 'INFO' do. TABENGINE_RESPONSE_INFO
case.        do. TABENGINE_RESPONSE_NOT_IMPLEMENTED,y
end.
)

set_ucase=: 3 : 0
  NB. dummy placeholder replaced by set_ucase_uu_
ssw '>>> set_ucase: dummy placeholder, y=(y)'
)

calcmd=: 3 : 0
  NB. dummy placeholder --will use formatIN_uu_
ssw '>>> calcmd: not implemented, calco=[(calco)]'
)

TABENGINE_RESPONSE_Init=: 0 : 0
dummy tabengine Init confirmation
)

TABENGINE_RESPONSE_INFO=: 0 : 0
dummy tabengine INFO content
)

TABENGINE_RESPONSE_NOT_IMPLEMENTED=: 0 : 0
dummy tabengine NOT IMPLEMENTED--
)

UNSET=: '<UNSET>'

putsb=: 3 : 0
wd 'psel tab; set sbar setlabel status ',dquote ":,y
)

Handler=: 3 : 0
ssw '+++ Handler: (y) at: ',date''
)

line=: smoutput bind '==============================='

click=: 3 : 0
line''
Handler 'click'
if. y=1 do.		NB. mouseDown
  ssw '... click: mouseDown, sysdata=(sysdata)'
  1 fill_tools TOOLID
else.			NB. mouseUp
  ssw '... click: mouseUp,   sysdata=(sysdata)'
  doit TOOLID
end.
inputfocus''
)

doit=: 3 : 0
  NB. do the tool action: y
if. -. y e. i.32 do. return. end.
action=. dtb 3 }. 13 {. y{TOOLHINT
ssw '... doit: y=(y) action=[(action)]'
)

clicktab=: 3 : 0
Handler 'clicktab'
n=. ".tabs_select
select. n
case. 1 do. fillconsts''
case. 2 do. fillfuncts''
case. 3 do. ttinf''
end.
setshow n
inputfocus''
)

fillttable=: 3 : 0
Handler 'fillttable'
wd 'psel tab; set panel items *',CONTENT_TTABLE,date''
)

fillconsts=: 3 : 0
Handler 'fillconsts'
set_ucase casec-: ,'0'
NB. wd 'psel tab; set cons items *',x2f uurowsc searchc
wd 'psel tab; set cons items *',CONTENT_CONSTANTS,date''
)

fillfuncts=: 3 : 0
Handler 'fillfuncts'
set_ucase casef-: ,'0'
NB. wd 'psel tab; set func items *',x2f uurowsf searchf
wd 'psel tab; set func items *',CONTENT_FUNCTIONS,date''
)

CONTENT_TTABLE=: 0 : 0
Pseudogravity by rotation
  ┌    {1}        0.017 Hz      Frequency; hertz=
┌ │ ┌  {2}        0.338 km      r:radius of circuit
│ ├ └> {3}        2.126 km      circumference
├ └>   {4}        0.035 km/s    v:rotational speed
└>┌    {5}        3.710 m/(s²)  c:centripetal acceleration
  │ ┌  {6}            0 /       i:selector (1 or 2)
  │ ├  {7}        9.810 m/(s²)  g:earth gravity unit=
  │ ├  {8}        3.710 m/(s²)  a:mars gravity unit=
  ├ └> {9}        9.810 *       target pseudogravity
  └>   {10}       0.378 *       Set "U" to force equal
)

CONTENT_CONSTANTS=: 0 : 0
dummy content for Constants tab
Second line
line 3 --
)

CONTENT_FUNCTIONS=: 0 : 0
dummy content for Functions tab
Second line
line 3 --
)

ttinf=: 1 ddefine  NB. modified from: ~Gittab/tabula.ijs
Handler 'ttinf'
if. x-:1 do.
  z=. tabengine 'INFO'
  wd 'psel tab; set info text *',z
  confirm 'ttable info retrieved'
elseif. x-:0 do.
  wd 'psel tab; set info text ""'
elseif. do.
  if. 0=#y do. y=. info end.
  tabenginex 'info' ; y
  confirm sw 'Info: $=($y) updated in t-table: (NAME_TTABLE)'
end.
)

NAME_TTABLE=: 'SAMPLE'

confirm=: 0 ddefine
putsb CONTENT_CONFIRM=: y
y return.
)

setshow=: 3 : 'wd ''psel tab; set tabs active '',":TABNDX=: y'

inputfocus=: 3 : 0
Handler 'inputfocus'
wd 'psel tab; pactive'
select. TABNDX
case. 0 do. wd 'psel tab; setfocus calco'
case. 1 do. wd 'psel tab; setfocus searchc'
case. 2 do. wd 'psel tab; setfocus searchf'
case. 3 do. wd 'psel tab; setfocus info'
end.
empty''
)

clickpanel=: 3 : 0
Handler 'clickpanel'
for_row. >cutopen panel do.
z=. '{' takeafter row
]line=. ". '}' taketo z
]z=. dlb '}' takeafter z
]i=. {. I. '  ' E. z  NB. where qty ends
qty=. i{.z
com=. dlb i}. z
sval=. ' ' taketo qty
unit=. ' ' takeafter qty
smoutput line ; sval ; unit ; com
end.
)

'==================== handlers.ijs ===================='

nohnd=: 3 : 0
ssw '>>> NOT IMPLEMENTED: y=(y) sysevent=(sysevent)'
)

newc=: nohnd bind 'newc'
quit=: nohnd bind 'quit'
dofn=: nohnd bind 'dofn'
newf=: nohnd bind 'newf'
pickunits=: nohnd bind 'pickunits'
setpreci=: nohnd bind 'setpreci'

tab_calco_changed=: empty
0 : 0
ssw '>>> changed: calco=[(calco)] calco_select=(calco_select)'
)

tab_searchc_changed=: 3 : 0
ssw '>>> changed: casec=(casec) searchc=[(searchc)] searchc_select=(searchc_select)'
)

tab_searchf_changed=: 3 : 0
ssw '>>> changed: casef=(casef) searchf=[(searchf)] searchf_select=(searchf_select)'
)

tab_calco_char=: empty
tab_searchc_char=: empty
tab_searchf_char=: empty

mousemove=: 3 : 0
n=. 16  NB. (count) number of icons in a row
h=. w=. 32 NB. (px) height and width of an icon
'X Y'=. 2{.".sysdata
z=. n* Y>h
TOOLID=: z + <. X%w
fill_tools TOOLID  NB. hilite hovered tool
 confirm 13 }. TOOLID { TOOLHINT
NB.  confirm sw 'X=(X) Y=(Y) TOOLID=(TOOLID)'
  NB. Don't let hilite stay on forever…
sys_timer_z_=: hover_off_tabby_
wd'timer ',":TIMER_HOVER
)

TIMER_HOVER=: 1000 NB. (millisecs) delay before sys_timer_z_''

hover_off=: 3 : 0
Handler 'hover_off'  NB. redraw toolbar after: hover
wd 'timer 0'
fill_tools''
)

TOOLHINT=: >cutopen 0 : 0
0  newtt     New empty ttable                                      
1  opent     Open ttable... / Open SAMPLE                          
2  savts     Save ttable as Title / Save ttable as SAMPLE          
3  delit     Delete line                                           
4  undoredo  Undo / Redo                                         
5  additems  Add all selected items                              
6  subitems  Item 1 minus item 2 / Item 2 minus item 1           
7  mulitems  Multiply all selected items                         
8  divitems  Divide item 1 by item 2 / Divide item 2 by item 1   
9  powitems  Item 1 ^ item 2 / Item 2 ^ item 1                   
10 stept     Plot 0 to (value) / Plot (-value) to (+value)         
11 newsl     New line                                              
12 equal     New line = selected line                              
13 movud     Move line up / Move line down                         
14 copal     Copy entire ttable                                    
15 ttcont    Edit code of ttable as saved                         
16 restart   Show Term window / Restart TABULA                    
17 repos     Reset window pos+size / Reset original window pos+size
18 hold      Toggle Hold / Toggle Transient Hold                    
19 traca     Toggle TRACE (action-verbs) / Toggle TRACI (Handler1) 
20 iedit     Edit item name / Edit item formula                    
21 setval    Set value to 0 / Set value to 1                      
22 add1u     Add 1 / Subtract 1                                    
23 addpc     Add 1% / Subtract 1%                                  
24 by2pi     Times PI / Times 2*PI                                 
25 merge     Merge selected lines                                  
26 replot    Replot selected items only / Replot all items        
27 siunt     Convert to SI Units                                   
28 eduu      Edit consts / Edit functs                              
29 hlpca     Commands for CAL-engine / About CAL-engine            
30 hlpt      Help for TABULA                                        
31 showttinf Show ttable info / edit ttable info                
)

tab_calco_button=:           calcmd
tab_cappend_button=:         newc
tab_casec_button=: empty
tab_casef_button=: empty
tab_close=:                  quit
tab_cons_button=:            newc
tab_cons_select=: empty
tab_default=:                dofn
tab_fappend_button=:         newf
tab_func_button=:            newf
tab_func_select=: empty
tab_g_focus=: empty
tab_g_focuslost=: empty
tab_g_mbldown=:              click bind 1
tab_g_mblup=:                click bind 0
tab_g_mmove=:                mousemove
tab_panel_button=:           clickpanel
tab_panel_select=:           clickpanel
tab_preci_select=:           setpreci
tab_g_resize=: empty
tab_resize=: empty
tab_run=:                    start
tab_searchc_button=:         fillconsts
tab_searchf_button=:         fillfuncts
tab_tabs_button=:            clicktab
tab_tabs_select=:            clicktab
tab_xunit_button=: empty
tab_xunit_select=:           pickunits

'==================== start.ijs ===================='

start''
@@---DO NOT LOAD
(0 0 $ 1!:2&2) '==> loading: ',WS_starter_z_=: >{:4!:3''

NB. Internal script to load & start JHS server
NB. Thursday 29 June 2017  18:30:11

(18!:4@(<^:(L. < *@#))) 'z'     NB. cocurrent 'z'

UNSET=: '<UNSET>'
smout=: ]
smout=: 0 0 $ 1!:2&2     NB. comment-out this line to hide load-time messages
  NB. smout -is used by all scripts directly controlled by: starter.ijs
  NB. -dummy it to suppress all load-time messages like this...

smout '=== starter.ijs LOADING... ',6!:0 'YYYY-MM-DD hh:mm:ss'

taketolast=: [: ] (E. i: 1:) {. ]
droptolast=: [: ] (E. i: 1:) }. ]
takeafterlast=: [: ] (#@[ + E. i: 1:) }. ]
dropafterlast=: [: ] (#@[ + E. i: 1:) {. ]
bhsl=: '/'&$: : (4 : 'if. x={.y do. }.y else. y end.')
btsl=: '/'&$: : (4 : 'if. x={:y do. }:y else. y end.')
sl=: 4 : '(btsl x),''/'',bhsl y'   NB. for safely joining paths
fname=: [: (] }.~ [: - [: >: [: >: '.' i:~ ]) ] }.~ [: >: '/' i:~ ]
fnamext=: ] }.~ [: >: '/' i:~ ]

  NB. set APP_z_ to the path to THIS SCRIPT starter.ijs ...
APP=: '/' dropafterlast >1{ARGV

IACTOOLS=: APP sl 'IACTOOLS'
load IACTOOLS sl 'bc.ijs'
load IACTOOLS sl 'xp.ijs'
load IACTOOLS sl 'handy.ijs'

'STARTING' fwrite JSTATUSPATH=: APP,'jstatus.txt'

smout '========================================================'
load APP sl 'starter-payload.ijs'
smout '--- starter.ijs loads code for JHS server...'
load '~addons/ide/jhs/core.ijs'
writeloaded''   NB. [handy.ijs] scripts loaded to-date
smout '--- starter.ijs launches JHS server...'
smout '========================================================'
init_jhs_''     NB. (smout does not output to Xcode hereafter)

'OK' fwrite JSTATUSPATH
  NB. ...tells Swift app that server has done all its setup and tests

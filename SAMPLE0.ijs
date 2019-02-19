SAVED=: '2019-02-17  05:02:47'
CAPT=: 'angle sine and cosine'

TTIMAGE=: 0 define
angle sine and cosine                 
┌ ┌ ┌ ┌ {1}         1 rad      angle  
│ │ │ └>{2}   57.296°          ={1}   
│ │ └>  {3}       57° 17' 44"  ={1}   
│ └>  ┌ {4}     0.841 /        sine   
└>    ├ {5}     0.540 /        cosine 
      └>{6}     1.382 /        sin+cos
)

TT=: cmx 0 define
tn      tu  ts  td  tf                
angle   rad rad 0 0                   
={1}    deg rad 1 0 a                 
={1}    dms rad 1 0 a                 
sine    /   /   1 0 sin a ; a(rad) [/]
cosine  /   /   1 0 cos a ; a(rad) [/]
sin+cos /   /   4 5 a+b: a(/),b(/)    
)

vquan=: 0 1 57.2957795130823229 57.2957795130823229 0.841470984807896505 0.540302305868139765 1.38177329067603627

vfact=: 0 1 0.0174532925199432955 0.0174532925199432955 1 1 1

exe2=: 3 : 'a [a=. 1{y [ITEMNO=:2'
exe3=: 3 : 'a [a=. 1{y [ITEMNO=:3'
exe4=: 3 : '1 * (sin a) [a=. 1 * 1{y [ITEMNO=:4'
exe5=: 3 : '1 * (cos a) [a=. 1 * 1{y [ITEMNO=:5'
exe6=: 3 : 'a+b [a=. 4{y [b=. 5{y [ITEMNO=:6'

TTINFO=: 0 define
This is a sample t-table to demonstrate...

* the same value in alternative units -- [rad] as [deg] and [dms]
* applying a function to an item -- sin and cosine
* combining 2 items to create a new item.
)
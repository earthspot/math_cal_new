SAVED=: '2019-02-19  03:08:16'
CAPT=: 'temperature scales'

TTIMAGE=: 0 define
temperature scales                                           
┌ ┌ ┌ ┌ ┌ ┌ ┌ ┌ ┌ {1}  @       1 f.p  Freezing pt units      
│ │ │ │ │ │ │ │ └>{2}  @   0.732 b.p  Boiling pt units       
│ │ │ │ │ │ │ └>  {3}  @ 273.150 K    ={1}                   
│ │ │ │ │ │ └>    {4}  @       0 °C   ={1}                   
│ │ │ │ │ └>      {5}  @  32.000 °F   ={1}                   
│ │ │ │ └>        {6}  @   7.500 °Ro  ={1}                   
│ │ │ └>          {7}  @     150 °De  ={1}                   
│ │ └>            {8}  @ 491.670 °Ra  ={1}                   
│ └>              {9}  @       0 °Re  ={1}                   
└>                {10} @       0 °Ne  ={1}                   
)

TT=: cmx 0 define
tn                      tu    ts td  tf                 
Freezing pt units       f.p   K  0 0                    
Boiling pt units        b.p   K  1 0 a                  
={1}                    K     K  1 0 a                  
={1}                    degC  K  1 0 a                  
={1}                    degF  K  1 0 a                  
={1}                    degRo K  1 0 a                  
={1}                    degDe K  1 0 a                  
={1}                    degRa K  1 0 a                  
={1}                    degRe K  1 0 a                  
={1}                    degNe K  1 0 a                  
)

vquan=: 0 1 0.732011255527267868 273.149999999999977 0 32.0003999999999351 7.49994749994749377 150 491.670086097673277 0 0

vfact=: 0 273.149999999999977 373.149999999999977 1 1 0.55555555555555558 1.90476000000000001 _0.66666666666666663 0.555648000000000031 1.25 3.03029999999999999

exe10=: 3 : 'a [a=. 1{y [ITEMNO=:10'
exe2=: 3 : 'a [a=. 1{y [ITEMNO=:2'
exe3=: 3 : 'a [a=. 1{y [ITEMNO=:3'
exe4=: 3 : 'a [a=. 1{y [ITEMNO=:4'
exe5=: 3 : 'a [a=. 1{y [ITEMNO=:5'
exe6=: 3 : 'a [a=. 1{y [ITEMNO=:6'
exe7=: 3 : 'a [a=. 1{y [ITEMNO=:7'
exe8=: 3 : 'a [a=. 1{y [ITEMNO=:8'
exe9=: 3 : 'a [a=. 1{y [ITEMNO=:9'

TTINFO=: 0 define
This is a test ttable.
Purpose:
1. To show the various temperature scales TABULA can handle
2. To demonstrate backfitting.
)
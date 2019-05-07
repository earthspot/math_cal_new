SAVED=: '2019-05-07  08:29:01'
CAPT=: 'temperature scales'

TTIMAGE=: 0 define
temperature scales                                                
┌ ┌ ┌ ┌ ┌ ┌ ┌ ┌ ┌ {1}          1 f.p  Freezing pt units           
│ │ │ │ │ │ │ │ └>{2}      0.732 b.p  Boiling pt units            
│ │ │ │ │ │ │ └>  {3}          0 °C   Celsius: 0 to 100           
│ │ │ │ │ │ └>    {4}     32.000 °F   Fahrenheit: 32 to 212       
│ │ │ │ │ └>      {5}    273.150 K    Kelvin: 273.15 to 373.15    
│ │ │ │ └>        {6}    491.670 °Ra  Rankine: 491.67 to 671.64   
│ │ │ └>          {7}        150 °De  Delisle: 150 to 0           
│ │ └>            {8}          0 °Ne  Newton: 0 to 33             
│ └>              {9}          0 °Re  Reaumur: 0 to 80            
└>                {10}     7.500 °Ro  Roemer: 7.5 to 60           
)

TT=: cmx 0 define
tn                           tu    ts td  tf                 
Freezing pt units            f.p   K  0 0                    
Boiling pt units             b.p   K  1 0 a                  
Celsius: 0 to 100            degC  K  1 0 a                  
Fahrenheit: 32 to 212        degF  K  1 0 a                  
Kelvin: 273.15 to 373.15     K     K  1 0 a                  
Rankine: 491.67 to 671.64    degRa K  1 0 a                  
Delisle: 150 to 0            degDe K  1 0 a                  
Newton: 0 to 33              degNe K  1 0 a                  
Reaumur: 0 to 80             degRe K  1 0 a                  
Roemer: 7.5 to 60            degRo K  1 0 a                  
)

vquan=: 0 1 5463r7463 0 80001r2500 5463r20 68298875r138912 150 0 0 357140r47619

vfact=: 0 5463r20 7463r20 1 5r9 1 8682r15625 _2r3 30303r10000 5r4 47619r25000


TTINFO=: 0 define
Purpose:
1. To show the various temperature scales TABULA can handle
2. To show how a physical constant defines its own units, e.g. [f.p] [b.p]
3. To demonstrate backfitting.
https://en.wikipedia.org/wiki/Conversion_of_units_of_temperature
)
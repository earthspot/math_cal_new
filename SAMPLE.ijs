SAVED=: '2019-02-27  07:13:46'
CAPT=: 'plot test using Function plotline'

TTIMAGE=: 0 define
plot test using Function plotline             
┌   ┌ ┌ {1}       6 rad  angle                
├ ┌ │ └>{2}   -0.28 /    sine                 
├ ├ └>  {3}    0.96 /    cosine               
├ └>    {4}    0.68 /    sin+cos              
└>      {5}       0 /    plot {2}{3}{4} vs {1}
)

TT=: cmx 0 define
tn                    tu  ts  td      tf                                         
angle                 rad rad 0 0 0 0                                            
sine                  /   /   1 0 0 0 sin a ; a(rad) [/]                         
cosine                /   /   1 0 0 0 cos a ; a(rad) [/]                         
sin+cos               /   /   3 2 0 0 a+b: a(/),b(/)                             
plot {2}{3}{4} vs {1} /   /   1 2 3 4 plotline(X,U,V,W) ; X(*),U(*),V(*),W(*) [/]
)

vquan=: 0 6 _0.27941549819892586 0.960170286650366078 0.680754788451440218 0

vfact=: 0 1 1 1 1 1

vmodl=: 0 1 1 1 1 1

exe2=: 3 : '1 * (sin a) [a=. 1 * 1{y [ITEMNO=:2'
exe3=: 3 : '1 * (cos a) [a=. 1 * 1{y [ITEMNO=:3'
exe4=: 3 : 'a+b [a=. 3{y [b=. 2{y [ITEMNO=:4'
exe5=: 3 : '1 * (plotline(X,U,V,W)) [X=. 1 * 1{y [U=. 1 * 2{y [V=. 1 * 3{y [W=. 1 * 4{y [ITEMNO=:5'

TTINFO=: 0 define
uses function: plotline to specify the items to be plotted.

Can override the plotted items using tool: replot
)
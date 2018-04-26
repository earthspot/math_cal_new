'==================== [cal] exchange.ijs ===================='
NB. euro to other currency exchange-rate demo

NB. ===============================================
NB. IAC Mon 29 Jun 2015  12:51:20
NB. At one stage TABULA could handle currencies
NB.  as if they were scientific units.
NB. The functionality is broken.
NB. (It uses Oleg's old httpget).
NB. It would be useful to have in the new release.
NB. ===============================================

require 'format/zulu'
require 'strings'		NB. for: rplc
0 :0
>>> THIS NEEDS REPLACING...
require '~user/httpget.ijs'	NB. http://code.jsoftware.com/wiki/Scripts/HTTP%20Get
Look in NUBROW pages for a replacement browser.
)

coclass 'exch'

CUTAB0=: CUTAB=: 2 2$<;._1 ' USD 1.3760 GBP 0.87170'
URX=: 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml'

currencytableXML=: 3 : 0
 NB. extracts [2-COL] currency table from XML code: y
z=. y
z=. '<Cube currency' dropto z
z=. '</Cube>' taketo z
z=. z rplc '<Cube currency=';MT ; 'rate=';MT ; '/>';MT ; TAB;MT ; LF;SP ; QT;MT
z=. twos o2b z
)

exrate=: 3 : 0
CUTAB exrate y
:
 NB. the euro rate-of-exchange for a given currency
 NB. y is currency code, eg 'USD' or 'GBP'
 NB. x is table as returned by: currencytableXML
 NB. THIS IS SWAPPED FROM EXAMPLE IN: exchange_0.ijs !!!!!
bad=. _			NB. designated "bad value" to be returned
z=. (0{"1 x)-.each ' '	NB. table key col (deblanked)
z=. z i. <y		NB. find first instance of curr code
try. bad". >{:z{x	NB. return number in last element of row
catch. bad		NB. return bad value otherwise
end.
)

quoted=: 0: 	NB. crude fixup

start=: 3 : 0
	NB. start the locale...
NB. ------------------------------------------
smoutput '>>> exch: NEEDS BRINGING UP TO DATE (...exits)'
return.
NB. ------------------------------------------
CUTAB=: currencytableXML httpget URX
i.0 0
)

twos=: 3 : '((<.2%~$y),2)$y'		NB. reshape: 2-cols

0 :0
cocurrent 'base'
start_exch_''
smoutput 'GBP' ; exrate_exch_ 'GBP'
smoutput 'USD' ; exrate_exch_ 'USD'
smoutput 'XYZ' ; exrate_exch_ 'XYZ'	NB. not a quoted currency
)
'==================== getversion.ijs ===================='
NB. IAC Tue 30 Jun 2015  03:36:27

cocurrent 'z'

  NB. get version# from manifest.ijs in TPATH (y)
  NB. If no fail, overrides value in current locale
getversion=: 3 : 0
try.
bad=. fread''
assert. -. bad -: z=. fread y,'manifest.ijs'
assert. 0< # z=. LF taketo 'VERSION' dropto z
".z 	NB. hopefully assigns VERSION
catch. end.
)


0 : 0
smoutput VERSION_cal_ ; TPATH_RELEASE_z_
getversion_cal_ TPATH_RELEASE_z_
)

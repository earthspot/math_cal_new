Sunday 3 June 2018  07:31:25

Finder: GREEN DOTS given to source files -->SystemFolders in j807 installation
	to use with Breakback-- experiments

----
Tuesday 4 July 2017  19:55:53

This version of CAL now brought into service.

These scripts are now updated directly.
Changes are recorded in THIS TXTFILE as one-liners.

All temporary patches (for development/testing) reside in: starter-payload.ijs
…patches are to be moved there as their existence is uncovered.

----
Sunday 2 July 2017  00:04:13

This folder /CAL/ has been populated with the contents of:
/Users/ianclark/dev/cal/source/

These files have been discarded:
=LAST_UPLOADED

This folder's contents will be kept in a form for quick re-insertion into:
/Users/ianclark/dev/cal/source/
-in order to build an up-to-date copy of the JAL CAL addon.

———————————————————————————————————————————————————————————————————————————
CHANGES

Tuesday 4 July 2017

Identical fprefix_z_ and filename_cal_ added to starter-payload - uses i: not i.
INTD missing: load cal-instruction-set.ijs instead of CAL/califace.ijs
ARGEXP :: CAL/califace.ijs --> starter-payload.ijs
initialized, openSAMPLE, ttsavecs, sci, sig :: cal-residue.ijs --> starter-payload.ijs
smout header added to all effective CAL/files to verify loading in Xcode Debug area
cal-residue.ijs --removed reference [prior to deletion]
quasi-addon: math/iactools --deleted in favor of IACTOOLS/handy.ijs /bc.ijs /xp.ijs
SAMPLE*ijs --copied into CAL/

Wednesday 5 July 2017

New instruction: INST
new/upd z wds: re in (=: 0&instruction_cal_)
new/upd jhscal wds: create fixedup limited makeCTBU unsoldered
    NOTE: unbridged is not used by jhscal any more. But left in.
new/upd cal wds: instruction ttnew
…inserted as patch into starter-payload.ijs

Tuesday 22 August 2017

DO NOT LOAD message replaced by: DONOTLOAD'' (defined in starter-payload)
CAL/init.ijs --is now a DONOTLOAD

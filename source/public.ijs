	NB. cal - public.ijs
'==================== [cal] public ===================='

cocurrent 'cal'

uuconnect=: 3 : 0
  NB. setup local verbs that shadow the UU-instantiation verbs
  NB. other UU-instantiation verbs are called directly within code
uun=: '' conew 'uu'
uuengine		=: uuengine__uun
uniform		=: uniform__uun
i.0 0
)
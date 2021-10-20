/-  dm-hook
/+  default-agent
|%
+$  versioned-state
    $%  state-zero
    ==
::
+$  state-zero
    $:  [%0 counter=@]
    ==
::
+$  card  card:agent:gall
::
--
=|  state=versioned-state
^-  agent:gall
|_  =bowl:gall
+*  this      .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  '%mfys initialized successfully'
  =.  state  [%0 0]
  :_  this
  :~  [%pass /from-dm-hook %agent [our.bowl %dm-hook] %watch /updates]
  ==
++  on-save
  ^-  vase
  !>(state)
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  ~&  >  '%mfys recompiled successfully'
  :_  this(state !<(versioned-state old-state))
  :~  [%pass /from-dm-hook %agent [our.bowl %dm-hook] %watch /updates]
  ==
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
      %noun
    ?+    q.vase  (on-poke:def mark vase)
        %print-state
      ~&  >>  state
      ~&  >>>  bowl  `this
      ::
        %print-subs
      ~&  >>  &2.bowl  `this
    ==
  ==
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+     path  (on-watch:def path)
      [%counter ~]
      ~&  >>  "got counter subscription from {<src.bowl>}"  `this
  ==
++  on-leave
  |=  =path
  ~&  "got counter leave request from {<src.bowl>}"  `this
++  on-peek   on-peek:def
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+    wire  (on-agent:def wire sign)
      [%from-dm-hook ~]
    ?+  -.sign  (on-agent:def wire sign)
        %fact
      =/  dm-hook-action=action:dm-hook  !<(action:dm-hook q.cage.sign)
      ~&  >  "from-dm-hook: {<dm-hook-action>}"  `this
      :: ?+  -.dm-hook-action  (on-agent:def wire sign)
      ::     %pendings
      ::   ~&  >  "from-dm-hook: {<+.dm-hook-action>}"  `this
      ::     ::
      ::     %screen
      ::   ~&  >  "from-dm-hook: {<+.dm-hook-action>}"  `this
      :: ==
    ==
  ==
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--

/-  dm-hook, gs=graph-store, p=post, r=resource
/+  default-agent
|%
+$  versioned-state
    $%  state-zero
    ==
::
+$  state-zero
    $:  [%0 graph-to-post-to=(unit resource:r)]
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
  =.  state  [%0 ~]
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
  `this(state !<(versioned-state old-state))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
      %noun
    ?+    q.vase  (on-poke:def mark vase)
        %print-state
      ~&  >  state
      ~&  >  bowl  `this
      ::
        %print-subs
      ~&  >  &2.bowl  `this
      ::
        [%set-graph-to-post-to ^]
      =/  poke-arg=[@tas =resource:r]  !<([@tas resource:r] vase)
      ~&  >  "got %set-graph-to-post-to {<resource.poke-arg>}"
      `this(state [%0 [~ resource.poke-arg]])
    ==
  ==
::
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+    wire  (on-agent:def wire sign)
      [%from-dm-hook ~]
    ?+  -.sign  (on-agent:def wire sign)
        %fact
      =/  dm-hook-action=action:dm-hook  !<(action:dm-hook q.cage.sign)
      ~&  >  "from-dm-hook: {<dm-hook-action>}"
      ?~  graph-to-post-to.state
        `this
      =/  post=post:p
        :*  our.bowl
            /1
            now.bowl
            ~[[%text (crip "{<dm-hook-action>}")]]
            ~
            ~
        ==
      =/  add-nodes=[resource:r (map index.p node:gs)]
        :*  u.graph-to-post-to.state
            (malt ~[[/1 [[%.y post] [%empty ~]]]])
        ==
      :_  this
      :~  [%pass /to-group %agent [our.bowl %graph-push-hook] %poke %graph-update-3 !>([now.bowl [%add-nodes add-nodes]])]
      ==
    ==
  ==
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--

/-  blog
/+  dbug, default-agent
::
%-  agent:dbug
^-  agent:gall
=>  |%
    +$  versioned-state  $%(state-0)
    +$  state-0
      $:  files=(map path (pair html=@t md=@t))
      ==
    --
=|  state-0
=*  state  -
|_  bowl=bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
    card  card:agent:gall
++  on-init  on-init:def
++  on-save  !>(state)
++  on-load
  |=  =vase
  =+  !<(old=state-0 vase)
  `this(state old)
++  on-poke
  |=  [=mark =vase]
  ?>  =(%blog-action mark)
  =+  !<(act=action:blog vase)
  ?-    -.act
      %save-file
    :_  this(files (~(put by files) [path html md]:act))
    [%pass /bind %arvo %e %serve `path.act dap.bowl /gen/blog/hoon ~]~
  ::
      %delete-file
    :_  this(files (~(del by files) path.act))
    [%pass /bind %arvo %e %disconnect `path.act]~
  ==
++  on-agent  on-agent:def
++  on-watch  on-watch:def
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+    path  ~
  ::
      [%x %md ^]    ``blog+!>(q:(~(got by files) t.t.path))
      [%x %html ^]  ``blog+!>(p:(~(got by files) t.t.path))
  ::
      [%x %pages ~]
    :^  ~  ~  %json
    !>  :-  %a
    %+  turn  ~(tap by files)
    |=([=^path *] `json`(path:enjs:format path))
  ::
      [%x %all-bindings ~]
    :^  ~  ~  %json  !>
    %-  pairs:enjs:format
    %+  turn
      .^  (list [binding:eyre * action:eyre])  %e
          /(scot %p our.bowl)/bindings/(scot %da now.bowl)
      ==
    |=  [=binding:eyre * =action:eyre]
    ^-  [@t json]
    :-  (spat path.binding)
    ?-  -.action
      %gen             [%s (crip "desk: {<desk.generator.action>}")]
      %app             [%s (crip "app: {<app.action>}")]
      %authentication  [%s '%authentication']
      %logout          [%s '%logout']
      %channel         [%s '%channel']
      %scry            [%s '%scry']
      %name            [%s '%name']
      %four-oh-four    [%s '%four-oh-four']
    ==
  ==
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+  wire  (on-arvo:def wire sign-arvo)
    [%bind ~]  ?>(?=([%eyre %bound %.y *] sign-arvo) `this)
  ==
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--

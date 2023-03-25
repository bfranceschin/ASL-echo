/+  *test
/=  agent  /app/echo
|%
::  Build an example bowl manually.
::
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  [~zod ~zod %pomodoro]     :: (our src dap)
      [~ ~]                     :: (wex sup)
      [run `@uvJ`(shax run) *time [~zod %base ud+run]]
                                :: (act eny now byk)
  ==
::  Build a reference state mold.
::
+$  state
   $:  [%0 values=(list @)]
   ==
--
|%
::  Test adding push value.
::
++  test-poke
  =|  run=@ud
  =^  move  agent  (~(on-poke agent (bowl run)) %echo-action !>([%push ~zod 10.000]))
  =+  !<(=state on-save:agent)
  %+  expect-eq
    !>  `(list @)`~[10.000]
    !>  values.state
::
::  Test peek values.
::
++  test-peek
  =|  run=@ud
  =^  move  agent  (~(on-poke agent (bowl run)) %echo-action !>([%push ~zod 10.000]))
  =/  peek  (need (need (~(on-peek agent (bowl run)) [%x %values ~])))
  =+  !<(=state on-save:agent)
  %+  expect-eq
    !>  `(list @)`~[10.000]
    q.peek
--
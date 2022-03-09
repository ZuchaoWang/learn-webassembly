 (func (export "saveRegs")
  global.get $todo/regs
  i32.const 0
  i32.add
  global.get $~lib/rt/itcms/total
  i32.store 
  global.get $todo/regs
  i32.const 4
  i32.add
  global.get $~lib/rt/itcms/threshold
  i32.store 
  global.get $todo/regs
  i32.const 8
  i32.add
  global.get $~lib/rt/itcms/state
  i32.store 
  global.get $todo/regs
  i32.const 12
  i32.add
  global.get $~lib/rt/itcms/visitCount
  i32.store 
  global.get $todo/regs
  i32.const 16
  i32.add
  global.get $~lib/rt/itcms/pinSpace
  i32.store 
  global.get $todo/regs
  i32.const 20
  i32.add
  global.get $~lib/rt/itcms/iter
  i32.store 
  global.get $todo/regs
  i32.const 24
  i32.add
  global.get $~lib/rt/itcms/toSpace
  i32.store 
  global.get $todo/regs
  i32.const 28
  i32.add
  global.get $~lib/rt/itcms/white
  i32.store 
  global.get $todo/regs
  i32.const 32
  i32.add
  global.get $~lib/rt/itcms/fromSpace
  i32.store 
  global.get $todo/regs
  i32.const 36
  i32.add
  global.get $~lib/rt/tlsf/ROOT
  i32.store 
  global.get $todo/regs
  i32.const 40
  i32.add
  global.get $~lib/memory/__stack_pointer
  i32.store
 )
 (func (export "restoreRegs")
  global.get $todo/regs
  i32.const 0
  i32.add
  i32.load
  global.set $~lib/rt/itcms/total 
  global.get $todo/regs
  i32.const 4
  i32.add
  i32.load
  global.set $~lib/rt/itcms/threshold 
  global.get $todo/regs
  i32.const 8
  i32.add
  i32.load
  global.set $~lib/rt/itcms/state 
  global.get $todo/regs
  i32.const 12
  i32.add
  i32.load
  global.set $~lib/rt/itcms/visitCount 
  global.get $todo/regs
  i32.const 16
  i32.add
  i32.load
  global.set $~lib/rt/itcms/pinSpace 
  global.get $todo/regs
  i32.const 20
  i32.add
  i32.load
  global.set $~lib/rt/itcms/iter 
  global.get $todo/regs
  i32.const 24
  i32.add
  i32.load
  global.set $~lib/rt/itcms/toSpace 
  global.get $todo/regs
  i32.const 28
  i32.add
  i32.load
  global.set $~lib/rt/itcms/white 
  global.get $todo/regs
  i32.const 32
  i32.add
  i32.load
  global.set $~lib/rt/itcms/fromSpace 
  global.get $todo/regs
  i32.const 36
  i32.add
  i32.load
  global.set $~lib/rt/tlsf/ROOT 
  global.get $todo/regs
  i32.const 40
  i32.add
  i32.load
  global.set $~lib/memory/__stack_pointer
 )
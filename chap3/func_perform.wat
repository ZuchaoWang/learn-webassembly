(module
  ;; external call to a JavaScript function
  (import "js" "external_call" (func $external_call (result i32)))
  (global $i (mut i32) (i32.const 0)) ;; global for internal function

  (func $internal_call (result i32) ;; returns an i32 to calling function
    global.get $i
    i32.const 1
    i32.add
    global.set $i ;; The first 4 lines of code in the function increments $i
    global.get $i ;; $i is then returned to the calling function
  )

  (func (export "wasm_call")
    (loop $again
      call $internal_call
      ;; function "wasm_call" exported for JavaScript
      ;; $again loop
      ;; call $internal_call WASM function
      ;; is the value in $i <= 4,000,000?
      ;; if so repeat the loop
      i32.const 4_000_000
      i32.le_u
      br_if $again
    )
  )

  (func (export "js_call")
    (loop $again
      (call $external_call) ;; calls the imported $external_call function
      i32.const 4_000_000
      i32.le_u ;; is the value returned by $external_call <= 4,000,000?
      br_if $again ;; if so, branch to the beginning of the loop
    )
  )
)
const fs = require('fs');
const loader = require("@assemblyscript/loader");

(async () => {
  let module = await loader.instantiate(fs.readFileSync('todo.wasm'));

  function execCommand(cmd) {
    let cmd_index = module.exports.__newString(cmd);
    module.exports.execCommand(cmd_index);
  }

  function outputTodos() {
    let output_index = module.exports.outputTodos();
    let output = module.exports.__getString(output_index);
    console.log(output);
  }

  function saveSnapshot() {
    module.exports.saveRegs();
    return module.exports.memory.buffer.slice();
  }

  function restoreSnapshot(snapshot) {
    new Uint8Array(module.exports.memory.buffer).set(new Uint8Array(snapshot));
    module.exports.restoreRegs();
  }

  execCommand("A:1");
  outputTodos();
  execCommand("B:2");
  outputTodos();
  let snapshot = saveSnapshot();
  execCommand("C::");
  outputTodos();
  execCommand("A:3");
  outputTodos();
  execCommand("B:4");
  outputTodos();
  execCommand("B");
  outputTodos();
  restoreSnapshot(snapshot)
  outputTodos();
  execCommand("A:5");
  outputTodos();
  restoreSnapshot(snapshot)
  outputTodos();
  execCommand("B:6");
  outputTodos();
})();
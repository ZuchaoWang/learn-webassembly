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

  execCommand("A:1");
  outputTodos();
  execCommand("B:2");
  outputTodos();
  execCommand("C::");
  outputTodos();
  execCommand("B:3");
  outputTodos();
  execCommand("B");
  outputTodos();
})();
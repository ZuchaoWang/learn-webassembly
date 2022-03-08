const todos = new Map<string,string>();
const regs = new ArrayBuffer(1024);

function updateTodo(key: string, content: string): void {
  todos.set(key, content);
}

function deleteTodo(key: string): void {
  todos.delete(key);
}

export function outputTodos(): string {
  return todos.toString();
}

export function execCommand(cmd: string): void {
  var cmdSplit = cmd.split(":");
  if (cmdSplit.length == 1) {
    deleteTodo(cmdSplit[0]);
  } else if (cmdSplit.length == 2) {
    updateTodo(cmdSplit[0], cmdSplit[1]);
  }
}
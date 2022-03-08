asc todo.ts -o todo.wat
sed -i '' 's/String,~lib/String~lib/g' todo.wat
wat2wasm todo.wat
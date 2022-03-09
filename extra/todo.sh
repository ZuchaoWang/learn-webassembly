asc todo.ts --exportRuntime -o todo.wat
sed -i '' 's/String,~lib/String~lib/g' todo.wat
sed -i '' '/^$/d' todo.wat
sed -i '' '$ d' todo.wat
cat regs.wat >> todo.wat
echo "\n)" >> todo.wat
wat2wasm todo.wat
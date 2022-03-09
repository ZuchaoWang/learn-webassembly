# compile to wat so that we can modify the wasm
# exportRuntime so that we can use __newString and __getString
asc todo.ts --exportRuntime -o todo.wat

# the symbol names in wat include comma for Map object
# such names are invalid, so we remove the comma
sed -i '' 's/String,~lib/String~lib/g' todo.wat

# insert saveRegs and restoreRegs into wat file
# put them at the end of module
sed -i '' '/^$/d' todo.wat
sed -i '' '$ d' todo.wat
cat regs.wat >> todo.wat
echo "\n)" >> todo.wat

# compile wat to wasm
wat2wasm todo.wat
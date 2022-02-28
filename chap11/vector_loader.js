const fs = require("fs");
const loader = require("@assemblyscript/loader");
(async () => {
  let wasm = fs.readFileSync("vector_loader.wasm");
  // instantiate the module using the loader
  let module = await loader.instantiate(wasm);
  // module.exports.Vector2D mirrors the AssemblyScript class.
  let Vector2D = module.exports.Vector2D;
  let vector1 = new Vector2D(3, 4);
  let vector2 = new Vector2D(4, 5);
  vector2.y += 10;
  vector2.add(vector1);
  console.log(
    `vector1=(${vector1.x}, ${vector1.y})\nvector2=(${vector2.x}, ${
      vector2.y
    })\nvector1.magnitude=${vector1.Magnitude()}\nvector2.magnitude=${vector2.Magnitude()}`
  );
})();

const fs = require("fs");
(async () => {
  let wasm = fs.readFileSync("vector.wasm");
  let obj = await WebAssembly.instantiate(wasm, { env: { abort: () => {} } });
  let Vector2D = {
    init: function (x, y) {
      return obj.instance.exports["Vector2D#constructor"](0, x, y);
    },
    Magnitude: obj.instance.exports["Vector2D#Magnitude"],
  };
  let vec1_id = Vector2D.init(3, 4);
  let vec2_id = Vector2D.init(4, 5);
  console.log(`vec1.magnitude=${Vector2D.Magnitude(vec1_id)}\nvec2.magnitude=${Vector2D.Magnitude(vec2_id)}`);
})();

"use strict";

// document.addEventListener("DOMContentLoaded", function () {
//   define(["require", "./output/Main/index"], function (require) {
//     var app = require("./output/Main/index");
//     app
//   });

//   requirejs(["./output/Main/index"], function (lodash) {
//     console.log("ready!");
//   });
// });
// window.onload = function() {
//   requirejs(["./output/Main/index"], function (app) {
//     var app_ = require("./output/Main/index");
//     app_.main()
//   })
// }

const script = document.createElement('script')
script.src = "./output/Main/index"
script.onload = (app) => {
  console.log('Hello')
  var app_ = require("./output/Main/index");
}
document.head.append(script)
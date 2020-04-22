"use strict";
process.stdin.setEncoding("utf8");

process.stdin.once("readable", () => {
  const chunk = process.stdin.read();
  if (chunk !== null) {
    let result = JSON.parse(chunk);
    if (result) {
      process.stdout.write(result);
    }
  }
});

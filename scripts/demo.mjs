import { spawnSync } from "node:child_process";

const treeSitter = process.platform === "win32" ? "tree-sitter.cmd" : "tree-sitter";
const example = "examples/swing-showcase.java";

function run(args) {
  const result = spawnSync(treeSitter, args, {
    stdio: "inherit",
    shell: false,
  });
  if (result.status !== 0) {
    process.exit(result.status ?? 1);
  }
}

console.log(`Parsing ${example}`);
run(["parse", example]);

console.log("\nSwing query captures");
run(["query", "queries/swing.scm", example]);

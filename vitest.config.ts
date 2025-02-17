import { defineConfig } from "vite";

export default defineConfig({
  test: {
    environment: "jsdom",
    globals: true,
    setupFiles: "./setupTest.js",
    reporters: ["default", "junit"],
    outputFile: "test-results.xml",
    coverage: {
      provider: "v8",
      reporter: ["cobertura", "text", "html", "lcov"],
      reportsDirectory: "./coverage",
    },
  },
});
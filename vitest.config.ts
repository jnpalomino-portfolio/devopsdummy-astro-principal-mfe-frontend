import { defineConfig } from "vite";

export default defineConfig({
  test: {
    globals: true,
    environment: "jsdom", // Simula un navegador para pruebas de componentes
  },
});

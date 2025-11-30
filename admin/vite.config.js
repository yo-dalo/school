import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost/school/backend', // Your backend URL
        changeOrigin: true,
     //rewrite: path => path.replace(/^\/api/, ''),
      },
    '/uploads': {
        target: 'http://localhost/school/backend/', // Your backend URL
        changeOrigin: true,
     //rewrite: path => path.replace(/^\/api/, ''),
      },
    },
  },
});
#!/bin/bash
# VinylIQ Dashboard installer - run from root of Vinylytics repo
set -e
mkdir -p music-dashboard/src/components music-dashboard/src/composables music-dashboard/src/stores music-dashboard/src/assets music-dashboard/public

echo "Creating package.json..."
cat > music-dashboard/package.json << 'EOF'
{
  "name": "music-dashboard",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "@tailwindcss/postcss": "^4.2.4",
    "axios": "^1.16.0",
    "chart.js": "^4.5.1",
    "pinia": "^3.0.4",
    "vue": "^3.5.32",
    "vue-chartjs": "^5.3.3",
    "vue-router": "^4.6.4"
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^6.0.6",
    "autoprefixer": "^10.5.0",
    "postcss": "^8.5.14",
    "tailwindcss": "^4.2.4",
    "vite": "^8.0.10"
  }
}
EOF

cat > music-dashboard/vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
export default defineConfig({ plugins: [vue()] })
EOF

cat > music-dashboard/postcss.config.js << 'EOF'
export default { plugins: { '@tailwindcss/postcss': {} } }
EOF

cat > music-dashboard/index.html << 'EOF'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VinylIQ — Rotterdam Music Dashboard</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="/src/main.js"></script>
  </body>
</html>
EOF

cat > music-dashboard/src/main.js << 'EOF'
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import './style.css'
const app = createApp(App)
app.use(createPinia())
app.mount('#app')
EOF

echo "Files created successfully!"
echo "Next steps:"
echo "  cd music-dashboard"
echo "  npm install"
echo "  npm run dev"

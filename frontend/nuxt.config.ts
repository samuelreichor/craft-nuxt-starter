import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },

  modules: ['nuxt-craftcms'],

  css: ['~/assets/css/main.css'],

  devServer: {
    host: '0.0.0.0',
    port: 3000
  },

  vite: {
    plugins: [
      tailwindcss(),
    ],
    server: {
      hmr: {
        protocol: 'wss'
      }
    }
  },

  nitro: {
    devServer: {
      watch: ['./server']
    }
  },
  experimental: {
    payloadExtraction: false
  },

  runtimeConfig: {
    public: {
      environment: '',
      primarySiteUrl: '',
    },
  },

  craftcms: {
    baseUrl: process.env.NUXT_PRIMARY_SITE_URL,
    debug: true,
  },
})

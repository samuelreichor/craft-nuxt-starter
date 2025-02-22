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
      primarySiteUrl: 'https://craft-nuxt-starter.ddev.site',
      primarySiteUrlDe: 'https://craft-nuxt-starter.ddev.site/de',
      primarySiteUrlEs: 'https://craft-nuxt-starter.ddev.site/es',
    },
  },

  craftcms: {
    baseUrl: process.env.NUXT_PRIMARY_SITE_URL,
    debug: false,
    siteMap: [
      {
        handle: 'en',
        origin: process.env.NUXT_PRIMARY_SITE_URL!,
        id: 1,
        lang: 'en',
        label: 'En'
      },
      {
        handle: 'de',
        origin: process.env.NUXT_PRIMARY_SITE_URL_DE!,
        id: 2,
        lang: 'de',
        label: 'De'
      },
      {
        handle: 'es',
        origin: process.env.NUXT_PRIMARY_SITE_URL_ES!,
        id: 3,
        lang: 'es',
        label: 'Es'
      },
    ]
  },
})

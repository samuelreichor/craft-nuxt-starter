import tailwindcss from '@tailwindcss/vite'

export default defineNuxtConfig({
  modules: [
    'nuxt-craftcms',
    '@nuxt/eslint',
  ],

  devtools: {
    enabled: true,
    timeline: {
      enabled: true,
    },
  },

  css: ['~/assets/css/main.css'],

  runtimeConfig: {
    public: {
      environment: '',
      primarySiteUrl: 'https://craft-nuxt-starter.ddev.site',
      primarySiteUrlDe: 'https://craft-nuxt-starter.ddev.site/de',
      primarySiteUrlEs: 'https://craft-nuxt-starter.ddev.site/es',
    },
  },

  devServer: {
    host: '0.0.0.0',
    port: 3000,
  },

  experimental: {
    crossOriginPrefetch: true,
  },

  compatibilityDate: '2024-04-03',

  nitro: {
    devServer: {
      watch: ['./server'],
    },
  },

  vite: {
    plugins: [
      tailwindcss(),
    ],
    server: {
      hmr: {
        protocol: 'wss',
      },
    },
  },

  craftcms: {
    baseUrl: process.env.NUXT_PRIMARY_SITE_URL,
    authToken: process.env.NUXT_CRAFT_TOKEN,
    debug: false,
    siteMap: [
      {
        handle: 'en',
        origin: process.env.NUXT_PRIMARY_SITE_URL!,
        path: '/',
        id: 1,
        lang: 'en',
        label: 'En',
      },
      {
        handle: 'de',
        origin: process.env.NUXT_PRIMARY_SITE_URL_DE!,
        path: '/de',
        id: 2,
        lang: 'de',
        label: 'De',
      },
      {
        handle: 'es',
        origin: process.env.NUXT_PRIMARY_SITE_URL_ES!,
        path: '/es',
        id: 3,
        lang: 'es',
        label: 'Es',
      },
    ],
  },

  eslint: {
    config: {
      stylistic: true,
    },
  },
})

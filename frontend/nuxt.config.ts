// https://nuxt.com/docs/api/configuration/nuxt-config
/* console.log(process.env.DDEV_HOSTNAME) */
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },

  modules: ['nuxt-craftcms'],

  devServer: {
    host: '0.0.0.0',
    port: 3000
  },

  vite: {
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

  craftcms: {
    baseUrl: 'https://api.craft-nuxt-starter.ddev.site',
    debug: true,
  },
})

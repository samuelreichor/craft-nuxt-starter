// https://nuxt.com/docs/api/configuration/nuxt-config
/* console.log(process.env.DDEV_HOSTNAME) */
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },

  modules: ['nuxt-craftcms'],

  craftcms: {
    baseUrl: 'https://craft-nuxt-starter.ddev.site:8443',
    debug: true,
  },
})
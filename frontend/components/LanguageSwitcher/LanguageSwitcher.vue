<script setup lang="ts">
import type { CraftSites } from 'vue-craftcms'

// Get global defined sitemap
const { siteMap } = useRuntimeConfig().public.craftcms
const typedSiteMap = siteMap as CraftSites

// Get active site
const currentSite = useCraftCurrentSite()
</script>

<template>
  <ul class="flex gap-4">
    <li
      v-for="site in typedSiteMap"
      :key="site.handle"
    >
      <NuxtLink
        :to="site.handle === 'en' ? '/' : '/' + site.handle"
        :class="{ 'font-bold': currentSite.handle === site.handle }"
      >
        {{ site.label }}
      </NuxtLink>
    </li>
  </ul>
</template>

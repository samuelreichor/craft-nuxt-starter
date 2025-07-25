<script setup lang="ts">
import type { CraftSites } from '@query-api/nuxt'
import type { CraftEntryMeta } from '~/types/base'

type DefaultEntry = { metadata: CraftEntryMeta }

// Get global defined sitemap
const { siteMap } = useRuntimeConfig().public.craftcms
const typedSiteMap = siteMap as CraftSites

// Get current entry id
const currentEntry = inject<Ref<DefaultEntry>>('entry')
const id = ref(0)
if (currentEntry) {
  id.value = currentEntry.value.metadata.id
}

// Query entries on other sites based on site id and entry id
const activeSites = ref()
const siteIdArr = typedSiteMap.map(site => site.id) as number[]
await useCraftEntry().siteId(siteIdArr).id(id.value).fields('metadata').all().then(({ data, error }) => {
  if (error.value) {
    console.error((error.value))
  }
  if (data.value) {
    const typedRespData = data.value as DefaultEntry[]
    activeSites.value = typedRespData.map((entry: DefaultEntry) => ({
      uri: entry.metadata.fullUri,
      url: entry.metadata.url,
      label: getSiteLabelById(entry.metadata.siteId),
    }))
  }
})

function getSiteLabelById(id: number) {
  const site = typedSiteMap.find(site => site.id === id)
  return site ? site.label : undefined
}
</script>

<template>
  <ul class="flex gap-4">
    <li
      v-for="site in activeSites"
      :key="site.url"
    >
      <NuxtLink
        :to="site.uri"
      >
        {{ site.label }}
      </NuxtLink>
    </li>
  </ul>
</template>

<style scoped>
.router-link-active {
  font-weight: bold;
}
</style>

<script setup lang="ts">
type Node = {
  metadata: NodeMetadata
  title: string
  url: string
  uri: string
  fullUri: string
  type: string
  level: number
}

type NodeMetadata = {
  id: number
  siteId: number
}

const currentSite = useCraftCurrentSite()
const { baseUrl } = useRuntimeConfig().public.craftcms
const apiUrl = computed(() => `${baseUrl}/v1/api/queryApi/customQuery?elementType=navigation&handle=mainNavigation&siteId=${currentSite.value.id}&all=1`)

const { data: links, error } = useFetch(apiUrl, {
  transform: (links: Node[]) => {
    return links.map(link => ({
      title: link.title,
      uri: link.fullUri,
      url: link.url,
    }))
  },
})

if (error.value) {
  console.log(error.value)
}
</script>

<template>
  <div class="flex justify-between py-6">
    <NuxtLink to="/">
      Cat
    </NuxtLink>
    <ul class="flex gap-4 items-center">
      <li
        v-for="link in links"
        :key="link.url"
      >
        <NuxtLink
          :to="link.uri"
        >
          {{ link.title }}
        </NuxtLink>
      </li>
    </ul>
    <div>
      <LanguageSwitcher />
    </div>
  </div>
</template>

<style scoped>
  .router-link-active {
    font-weight: bold;
  }
</style>

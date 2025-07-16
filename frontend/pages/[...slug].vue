<script setup lang="ts">
import type { ContentMapping } from '@query-api/nuxt'
import { useSeoMatic } from '~/composables/useSeoMatic'

// Pages
import Home from '~/templates/pages/home.vue'
import News from '~/templates/pages/news.vue'
import NewsOverview from '~/templates/pages/newsOverview.vue'

// Components
import ImageText from '~/templates/components/ImageTextBlock.vue'
import RichText from '~/templates/components/RichTextBlock.vue'
import Headline from '~/templates/components/HeadlineBlock.vue'
import Authors from '~/templates/components/AuthorsBlock.vue'

// Set SeoMatic Data
useSeoMatic()

// Map your Craft CMS data to your vue components and pages
const mapping: ContentMapping = {
  pages: {
    'home:entry_default': Home,
    'news:entry_news': News,
    'newsOverview:entry_newsOverview': NewsOverview,
  },
  components: {
    block_imageText: ImageText,
    block_richText: RichText,
    block_author: Authors,
    block_headline: Headline,
  },
}

// Inject global uri and current site
const uri = useCraftUri()
const currentSite = useCraftCurrentSite()

// Fetch entry by uri and current site
const { data, error } = await useCraftQuery('entries')
  .uri(uri.value)
  .site(currentSite.value.handle)
  .one()

if (error.value) {
  console.error(error.value)
}

// Provide entry globally
provide('entry', data)
</script>

<template>
  <NuxtLayout>
    <template #navigation>
      <Navigation />
    </template>
    <CraftPage
      v-if="data"
      :config="mapping"
      :content="data"
    />
    <template #footer />
  </NuxtLayout>
</template>

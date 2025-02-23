<script setup lang="ts">
import type { NewsEntry } from '~/components/RelatedNews/news-type'

const props = defineProps({
  news: {
    type: Array as PropType<NewsEntry[]>,
    required: true,
  },
  headline: {
    type: String,
    default: () => '',
  },
})
</script>

<template>
  <div>
    <Headline size="h2">
      {{ props.headline }}
    </Headline>
    <ul class="grid grid-cols-3 gap-4 mt-10">
      <li
        v-for="newsEntry in props.news"
        :key="newsEntry.metadata.id"
      >
        <RelatedNewsCard
          :image="newsEntry.image[0]"
          :rich-text="newsEntry.richText"
          :headline="newsEntry.headline"
          :url="newsEntry.metadata.url"
        />
      </li>
    </ul>
  </div>
</template>

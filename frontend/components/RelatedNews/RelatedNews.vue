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

const filteredNews = computed(() =>
  props.news.filter(entry => entry.image && entry.headline),
)
</script>

<template>
  <div>
    <Headline size="h2">
      {{ props.headline }}
    </Headline>
    <ul class="grid grid-cols-3 gap-4 mt-10">
      <li
        v-for="newsEntry in filteredNews"
        :key="newsEntry.metadata.id"
      >
        <RelatedNewsCard
          :image="newsEntry.image!"
          :headline="newsEntry.headline!"
          :rich-text="newsEntry.richText ?? ''"
          :url="newsEntry.metadata.fullUri"
        />
      </li>
    </ul>
  </div>
</template>

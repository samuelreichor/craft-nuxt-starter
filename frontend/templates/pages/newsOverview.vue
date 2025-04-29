<script setup lang="ts">
import type { PropType } from 'vue'
import type { NewsEntry } from '~/components/RelatedNews/news-type'
import type { EntryRelation } from '~/types/craftcms'

const props = defineProps({
  metadata: {
    type: Object,
    required: true,
  },
  sectionHandle: {
    type: String,
    required: true,
  },
  title: {
    type: String,
    required: true,
  },
  headline: {
    type: String,
    required: true,
  },
  singleNewsEntry: {
    type: Object as PropType<EntryRelation>,
    default: () => undefined,
  },
})

const heroNewsEntry = ref<NewsEntry>()
const newsEntries = ref<NewsEntry[]>()
const currentSite = useCraftCurrentSite()

await useCraftEntry()
  .section('news')
  .site(currentSite.value.handle)
  .orderBy('PostDate')
  .fields(['headline', 'richText', 'image'])
  .all()
  .then(({ data, error }) => {
    if (error.value) {
      console.error((error.value))
    }
    if (data.value && props.singleNewsEntry) {
      const { heroArticle, newsArticles } = splitNewsEntriesById(data.value as NewsEntry[], props.singleNewsEntry.id)
      heroNewsEntry.value = heroArticle
      newsEntries.value = newsArticles
    }
  })

function splitNewsEntriesById(newsEntries: NewsEntry[], id: number) {
  let heroArticle: NewsEntry | undefined
  const newsArticles: NewsEntry[] = []

  for (const entry of newsEntries) {
    if (entry.metadata.id === id) {
      heroArticle = entry
    }
    else {
      newsArticles.push(entry)
    }
  }
  return { heroArticle, newsArticles }
}
</script>

<template>
  <div class="mb-8">
    <ImageText
      v-if="heroNewsEntry && heroNewsEntry.image && heroNewsEntry.headline"
      :title="heroNewsEntry.headline"
      :intro-text="heroNewsEntry.richText"
      :image="heroNewsEntry.image"
      headline-size="h1"
    />
    <RelatedNews
      v-if="newsEntries"
      :news="newsEntries"
      :headline="props.headline"
      class="mt-20"
    />
  </div>
</template>

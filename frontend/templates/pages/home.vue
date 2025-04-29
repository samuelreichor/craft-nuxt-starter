<script setup lang="ts">
import type { EntryRelation } from '~/types/craftcms'
import type { NewsEntry } from '~/components/RelatedNews/news-type'
import type { ImageObject } from '~/components/Image/image-types'

export type BlockRelatedNews = {
  title: string
  selectNews: EntryRelation[]
}
const props = defineProps({
  metadata: {
    type: Object,
    required: true,
  },
  contentBuilder: {
    type: Array,
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
  richText: {
    type: String,
    required: true,
  },
  image: {
    type: Object as PropType<ImageObject>,
    default: () => undefined,
  },
  relatedNews: {
    type: Object as PropType<BlockRelatedNews>,
    default: () => undefined,
  },
})

const ids = ref<number[]>([0])
if (props.relatedNews && props.relatedNews.selectNews.length > 0) {
  ids.value = props.relatedNews.selectNews.map(news => news.id)
}
const currentSite = useCraftCurrentSite()
const currentSiteId = computed(() => currentSite.value.id)
const { data: news, error: newsError } = await useCraftEntry<NewsEntry[]>()
  .id(ids.value)
  .siteId(currentSiteId.value)
  .fields(['headline', 'image', 'richText'])
  .all()

if (newsError.value) {
  console.error(newsError.value)
}
</script>

<template>
  <div class="mb-8">
    <ImageText
      v-if="props.image && props.headline"
      :title="props.headline"
      :intro-text="props.richText"
      :image="props.image"
      headline-size="h1"
    />
    <CraftArea
      v-if="props.contentBuilder"
      :content="props.contentBuilder"
    />
    <RelatedNews
      v-if="props.relatedNews && news"
      :news="news"
      :headline="props.relatedNews.title"
      class="mt-20"
    />
  </div>
</template>

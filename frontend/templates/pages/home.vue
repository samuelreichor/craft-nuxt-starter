<script setup lang="ts">
import type { CraftPageEntryDefault, CraftPageEntryNews } from '~/types/base'

const props = defineProps<CraftPageEntryDefault>()

const ids = ref<number[]>([0])
if (props.relatedNews && props.relatedNews.selectNews.length > 0) {
  ids.value = props.relatedNews.selectNews.map(news => news.id)
}
const currentSite = useCraftCurrentSite()
const currentSiteId = computed(() => currentSite.value.id)
const { data: news, error: newsError } = await useCraftEntry<CraftPageEntryNews[]>()
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
      :intro-text="props.richText ?? ''"
      :image="props.image ?? null"
      headline-size="h1"
    />
    <CraftArea
      v-if="props.contentBuilder"
      :content="props.contentBuilder"
    />
    <RelatedNews
      v-if="props.relatedNews && news"
      :news="news"
      :headline="props.relatedNews.title ?? ''"
      class="mt-20"
    />
  </div>
</template>

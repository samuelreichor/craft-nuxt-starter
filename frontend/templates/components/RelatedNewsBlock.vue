<script setup lang="ts">
import type { EntryRelation } from '~/types/craftcms'
import type { NewsEntry } from '~/components/RelatedNews/news-type'

const props = defineProps({
  title: {
    type: String,
    default: () => '',
  },
  selectNews: {
    type: Array as PropType<EntryRelation[]>,
    default: () => [],
  },
})

const ids = ref<number[]>([0])
if (props.selectNews.length > 0) {
  ids.value = props.selectNews.map(news => news.id)
}
const currentSite = useCraftCurrentSite()
const { data: news, error: newsError } = useCraftQuery('entries').id(ids.value).siteId(currentSite.value.id).fields(['headline', 'image', 'richText']).all()

if (newsError.value) {
  console.error(newsError.value)
}
</script>

<template>
  <RelatedNews
    v-if="news"
    :news="news as NewsEntry[]"
    :headline="props.title"
    class="mt-20"
  />
</template>

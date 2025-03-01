<script setup lang="ts">
import type { PropType } from 'vue'
import type { NewsEntry } from '~/components/RelatedNews/news-type'
import type { DefaultEntry } from '~/types/craftcms'
import type { ImageObject } from '~/components/Image/image-types'

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
})

const currentEntry = inject<Ref<DefaultEntry>>('entry')
const currentEntryId = computed(() => currentEntry?.value.metadata.id)
const { data: news, error } = useCraftEntry()
  .section('news')
  .id(['not', currentEntryId.value ?? 0])
  .limit(3)
  .orderBy('PostDate')
  .fields(['headline', 'richText', 'image'])
  .all()

if (error.value) {
  console.error(error.value)
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
      v-if="news"
      :news="news as NewsEntry[]"
      headline="More News"
      class="mt-20"
    />
  </div>
</template>

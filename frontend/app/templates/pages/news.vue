<script setup lang="ts">
import type { CraftPageEntryNews } from '~/types/base'

const props = defineProps<CraftPageEntryNews>()

const currentSite = useCraftCurrentSite()
const currentEntry = inject<Ref<CraftPageEntryNews>>('entry')
const currentEntryId = computed(() => currentEntry?.value.metadata.id)
const currentSiteId = computed(() => currentSite.value.id)

const { data: news, error } = await useCraftEntry<CraftPageEntryNews[]>()
  .section('news')
  .id(['not', currentEntryId.value ?? 0])
  .limit(3)
  .siteId(currentSiteId.value)
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
      :news="news"
      headline="More News"
      class="mt-20"
    />
  </div>
</template>

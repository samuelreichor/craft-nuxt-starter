<script setup lang="ts">
const props = defineProps({
  metadata: {
    type: Object,
    required: true,
  },
  contentBuilder: {
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
  richText: {
    type: String,
    required: true,
  },
  image: {
    type: Object,
    default: () => undefined,
  },
  relatedNews: {
    type: Object,
    default: () => undefined,
  },
})
</script>

<template>
  <div class="mb-8">
    <ImageText
      v-if="props.image && props.headline"
      :title="props.headline"
      :intro-text="props.richText"
      :image="props.image[0]"
      headline-size="h1"
    />
    <CraftArea
      v-if="props.contentBuilder"
      :content="props.contentBuilder"
    />
    <CraftArea
      v-if="props.relatedNews"
      :content="props.relatedNews"
    />
  </div>
</template>

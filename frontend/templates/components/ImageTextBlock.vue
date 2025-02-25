<script setup lang="ts">
import type { ImageObject } from '~/components/Image/image-types'

const props = defineProps({
  image: {
    type: Object as PropType<ImageObject>,
    required: true,
  },
  headline: {
    type: String,
    required: true,
  },
  richText: {
    type: String,
    default: () => '',
  },
})
</script>

<template>
  <ImageText
    :image="image"
    :title="props.headline"
    :intro-text="props.richText"
    class="mt-16"
  />
</template>

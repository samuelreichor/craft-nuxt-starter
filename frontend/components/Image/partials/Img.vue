<script setup lang="ts">
import type { ImageRatio } from '../image-types'
import { sharedImageProps } from '../image-props'

const props = defineProps({
  ...sharedImageProps,
})

const setFocalPoint = () => {
  return `${(props.image?.focalPoint.x ?? 0.5) * 100}% ${(props.image?.focalPoint.y ?? 0.5) * 100}%`
}

function calculateHeight(width: number, ratio: ImageRatio) {
  if (ratio === 'auto') return props.image?.height
  const [ratioWidth, ratioHeight] = ratio.split(':').map(Number)
  return (width * ratioHeight) / ratioWidth
}

const imgHeight = computed(() =>
  calculateHeight(props.image?.width ?? 0, props.transform),
)
</script>

<template>
  <img
    v-if="props.image"
    :loading="props.lazy ? 'lazy' : 'eager'"
    :src="props.image.src"
    :srcset="props.image.srcSets[props.transform]"
    :alt="props.image.title"
    :width="props.image.width"
    :height="imgHeight"
    sizes="100vw"
    class="w-full h-full"
    :style="`object-fit: ${props.objectFit}; object-position: ${setFocalPoint()};`"
  >
</template>

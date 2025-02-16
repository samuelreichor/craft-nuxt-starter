<script setup lang="ts">
import type {ImageObject} from "~/components/Image/image-types";

const props = defineProps({
  image: {
    type: Array as PropType<ImageObject[]>,
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
  <ImageText :image="image[0] as ImageObject" :title="props.headline" :introText="props.richText"/>
</template>

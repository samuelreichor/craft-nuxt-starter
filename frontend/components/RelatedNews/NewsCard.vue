<script setup lang="ts">
import type { ImageObject } from '../Image/image-types'

const props = defineProps({
  url: {
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
    required: true,
  },
})
</script>

<template>
  <NuxtLink
    :href="props.url"
    class="flex flex-col gap-4 !bg-gray-100 h-full"
  >
    <div class="px-6 pb-6">
      <Headline size="h3">
        {{ props.headline }}
      </Headline>
      <RichText
        class="!mt-1 text-lg"
        :text="props.richText"
      />
    </div>
    <Image
      transform="3:2"
      class="order-first"
      :image="props.image"
    />
  </NuxtLink>
</template>

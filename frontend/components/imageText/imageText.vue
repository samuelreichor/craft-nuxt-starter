<script setup lang="ts">
import type { HeadlineValue } from '../Headline/headline-types'
import type { ImageObject } from '~/components/Image/image-types'
import RichText from '~/components/RichText/RichText.vue'

const props = defineProps({
  image: {
    type: Object as PropType<ImageObject>,
    required: true,
  },
  title: {
    type: String,
    required: true,
  },
  introText: {
    type: String,
    default: () => '',
  },
  headlineSize: {
    type: String as PropType<HeadlineValue>,
    default: () => 'h2',
  },
})
</script>

<template>
  <div class="flex gap-10">
    <div class="w-1/2">
      <Headline :size="props.headlineSize">
        {{ props.title }}
      </Headline>
      <RichText
        class="mt-4 text-lg sm:mt-6"
        :text="props.introText"
      />
    </div>
    <div class="w-1/2">
      <Image
        :image="props.image"
        transform="3:2"
        :lazy="false"
        object-fit="contain"
      />
    </div>
  </div>
</template>

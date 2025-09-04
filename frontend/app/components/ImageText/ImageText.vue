<script setup lang="ts">
import RichText from '~/components/RichText/RichText.vue'
import type { CraftAsset, CraftOptionValueHeadlineTag } from '~/types/base'

const props = defineProps({
  image: {
    type: Object as PropType<CraftAsset>,
    required: true,
  },
  title: {
    type: String,
    required: true,
  },
  introText: {
    type: String as PropType<string | null>,
    default: () => '',
  },
  headlineSize: {
    type: String as PropType<CraftOptionValueHeadlineTag>,
    default: () => 'h2',
  },
})
</script>

<template>
  <div
    v-if="props.image && props.title"
    class="flex gap-10"
  >
    <div class="w-1/2">
      <Headline :size="props.headlineSize">
        {{ props.title }}
      </Headline>
      <RichText
        v-if="props.introText"
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

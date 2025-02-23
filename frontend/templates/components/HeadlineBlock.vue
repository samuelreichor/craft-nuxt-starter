<script setup lang="ts">
import type { HeadlineTag } from '~/components/Headline/headline-types'

const props = defineProps({
  headline: {
    type: String,
    required: true,
  },
  headlineTag: {
    type: Object as PropType<HeadlineTag>,
    required: true,
  },
})
</script>

<template>
  <Headline
    :size="props.headlineTag.value"
    class="mt-20"
  >
    {{ props.headline }}
  </Headline>
</template>

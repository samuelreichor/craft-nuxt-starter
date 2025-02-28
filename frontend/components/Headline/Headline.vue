<script setup lang="ts">
import type { HeadlineValue } from '~/components/Headline/headline-types'

const props = defineProps({
  size: {
    type: String as PropType<HeadlineValue>,
    default: () => 'h2',
  },
  as: {
    type: String,
    default: () => 'h2',
  },
})

const sizes: Record<HeadlineValue, string> = {
  h1: 'h1-styling',
  h2: 'h2-styling',
  h3: 'h3-styling',
  h4: 'h4-styling',
  h5: 'h5-styling',
  h6: 'h6-styling',
}
</script>

<template>
  <component
    :is="props.as"
    :class="['headline-root', sizes[props.size]]"
  >
    <slot />
  </component>
</template>

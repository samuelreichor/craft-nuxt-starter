<script setup lang="ts">
import type { CraftOptionValueHeadlineTag } from '~/types/base'

const props = defineProps({
  size: {
    type: String as PropType<CraftOptionValueHeadlineTag>,
    default: () => 'h2',
  },
  as: {
    type: String,
    default: () => 'h2',
  },
})

const sizes: Record<CraftOptionValueHeadlineTag, string> = {
  h1: 'h1-styling',
  h2: 'h2-styling',
  h3: 'h3-styling',
  h4: 'h4-styling',
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

<script setup lang="ts">
import type { CraftEntryTypeBlockHeadline } from '~/types/base'

const props = defineProps<CraftEntryTypeBlockHeadline>()
</script>

<template>
  <Headline
    :size="props.headlineTag.value"
    class="mt-20"
  >
    {{ props.headline }}
  </Headline>
</template>

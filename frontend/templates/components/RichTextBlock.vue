<script setup lang="ts">
import type { CraftEntryTypeBlockRichText } from '~/types/base'

const props = defineProps<CraftEntryTypeBlockRichText>()
</script>

<template>
  <RichText
    v-if="props.richText"
    :text="props.richText"
  />
</template>

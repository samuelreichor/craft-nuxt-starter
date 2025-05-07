<script setup lang="ts">
import type { CraftEntryTypeBlockImageText } from '~/types/base'

const props = defineProps<CraftEntryTypeBlockImageText>()
</script>

<template>
  <ImageText
    v-if="props.image && props.headline"
    :image="props.image"
    :title="props.headline"
    :intro-text="props.richText ?? ''"
    class="mt-16"
  />
</template>

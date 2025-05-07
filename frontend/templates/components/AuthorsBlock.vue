<script setup lang="ts">
import type { CraftEntryTypeBlockAuthor } from '~/types/base'

const props = defineProps<CraftEntryTypeBlockAuthor>()
</script>

<template>
  <Authors
    v-if="props.selectUsers"
    :users="props.selectUsers"
  />
</template>

<script setup lang="ts">
const props = defineProps({
  richText: {
    type: String,
    required: true,
  },
})
</script>

<template>
  <RichText :text="props.richText"/>
</template>

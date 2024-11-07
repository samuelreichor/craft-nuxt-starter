<script setup lang="ts">
  const props = defineProps({
    text: {
      type: String,
      required: true,
    },
    headlineTag: {
      type: String,
      default: () => 'h2'
    }
  })
</script>

<template>
  <component :is="props.headlineTag">{{ props.text }}</component>
</template>
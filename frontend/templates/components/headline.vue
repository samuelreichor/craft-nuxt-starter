<script setup lang="ts">
  const props = defineProps({
    text: {
      type: String,
      required: true,
    },
    headlineTag: {
      type: Object,
      default: () => undefined
    }
  })
</script>

<template>
  <Headline :text="props.text" :headline-tag="props.headlineTag?.value"/>
</template>
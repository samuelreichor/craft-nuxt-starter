<script setup lang="ts">
  const props = defineProps({
    metadata: {
      type: Object,
      required: true,
    },
    contentBuilder: {
      type: Object,
      required: true,
    },
    sectionHandle: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    asset: {
      type: Object,
      default: () => undefined,
    },
  })
</script>

<template>
  <div>
    <h1>{{ props.title }}</h1>
    <CraftArea v-if="props.contentBuilder" :content="props.contentBuilder" />
  </div>
</template>
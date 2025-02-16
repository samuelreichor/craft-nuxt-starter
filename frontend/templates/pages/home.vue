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
    image: {
      type: Object,
      default: () => undefined,
    },
  })
</script>

<template>
  <div>
    <ImageText :title="props.title" :image="props.image[0]" class="!mt-0"/>
    <CraftArea v-if="props.contentBuilder" :content="props.contentBuilder" />
  </div>
</template>

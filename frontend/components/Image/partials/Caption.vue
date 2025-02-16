<script setup lang="ts">
  const props = defineProps({
    caption: {
      type: String,
      default: () => '',
    },
    as: {
      type: String,
      default: () => 'figcaption',
    },
  });
</script>

<template>
  <component :is="props.as" class="mt-4 text-sm">
    <p v-if="props.caption">{{ props.caption }}</p>
  </component>
</template>

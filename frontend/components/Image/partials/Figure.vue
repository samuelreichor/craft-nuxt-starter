<script setup lang="ts">
  import { sharedImageProps, captionProps } from '../image-props';

  const props = defineProps({
    ...sharedImageProps,
    ...captionProps,
  });
</script>

<template>
  <figure v-if="props.image" class="w-full h-full">
    <ImagePartialsImg
      :image="props.image"
      :lazy="props.lazy"
      :object-fit="props.objectFit"
      :transform="props.transform"
    />
    <ImagePartialsCaption :caption="props.caption" :class="props.captionClasses" />
  </figure>
</template>

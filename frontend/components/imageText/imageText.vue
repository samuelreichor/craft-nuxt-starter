<script setup lang="ts">
  import type { ImageObject } from '~/components/Image/image-types';
  import RichText from '~/components/RichText/RichText.vue';

  const props = defineProps({
    image: {
      type: Object as PropType<ImageObject>,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    introText: {
      type: String,
      default: () => '',
    },
  });
</script>

<template>
  <div class="flex gap-10 mt-16">
    <div class="w-1/2">
      <Headline class="text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
        {{ props.title }}
      </Headline>
      <RichText class="mt-4 text-lg sm:mt-6 sm:text-xl" :text="props.introText" />
    </div>
    <div class="w-1/2">
      <Image :image="props.image" transform="3:2" :lazy="false" object-fit="contain" />
    </div>
  </div>
</template>

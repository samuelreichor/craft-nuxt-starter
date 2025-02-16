<script setup lang="ts">
  const props = defineProps({
    text: {
      type: String,
      default: () => '',
    },
    variant: {
      type: String as PropType<RichTextVariant>,
      default: () => 'base',
    },
  });

  const slots = useSlots();

  const variants = {
    base: 'text-base',
    large: 'text-lg',
  };

  export type RichTextVariant = keyof typeof variants;
</script>

<template>
  <div
    v-if="props.text || slots.default"
    :class="['richtext-style max-w-[1100px] mt-16', variants[props.variant]]"
  >
    <div
      v-if="props.text"
      :class="['c-text--richText', variants[props.variant]]"
      v-html="props.text"
    />
    <slot v-else />
  </div>
</template>

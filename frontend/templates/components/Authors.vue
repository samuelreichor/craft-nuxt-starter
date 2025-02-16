<script setup lang="ts">
import type {AuthorObject} from "~/components/Authors/authors-types";

const props = defineProps({
  selectUsers: {
    type: Array as PropType<AuthorObject[]>,
    required: true,
  }
})
</script>

<template>
  <Authors :users="props.selectUsers"/>
</template>

<script lang="ts" setup>
  import type {AuthorObject} from "~/components/Authors/authors-types.js";

  const props = defineProps({
    users: {
      type: Array as PropType<AuthorObject[]>,
      required: true,
    }
  })
</script>

<template>
<div v-if="props.users" class="mt-16">
  <ul>
    <li class="flex items-center gap-4" v-for="user in props.users" >
      <div class="w-14 h-14 rounded-full overflow-hidden" v-if="user.photo">
        <Image :image="user.photo"/>
      </div>
      <div>
        <strong>{{user.username}}</strong>
        <p>{{user.email}}</p>
      </div>
    </li>
  </ul>
</div>
</template>

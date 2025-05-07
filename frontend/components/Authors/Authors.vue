<script lang="ts" setup>
import type { CraftUser } from '~/types/base'

const props = defineProps({
  users: {
    type: Array as PropType<CraftUser[]>,
    required: true,
  },
})
</script>

<template>
  <div
    v-if="props.users"
    class="mt-16"
  >
    <ul>
      <li
        v-for="user in props.users"
        :key="user.email!"
        class="flex items-center gap-4"
      >
        <div
          v-if="user.photo"
          class="w-14 h-14 rounded-full overflow-hidden"
        >
          <Image :image="user.photo" />
        </div>
        <div>
          <strong>{{ user.fullName }}</strong>
          <a
            class="block"
            :href="'mailto:' + user.email"
          >{{ user.email }}</a>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
const links = [
  {
    url: '/',
    title: 'Home',
  },
  {
    url: '/news/fat-cat',
    title: 'Fat Cat',
  },
]
const uri = useCraftUri();

function isActive(url: string) {
  return '/' + uri.value === url || (uri.value === '__home__' && url === '/');
}
</script>

<template>
  <div class="flex justify-between py-6">
    <NuxtLink to="/">
      Cat
    </NuxtLink>
    <ul class="flex gap-4 items-center">
      <li v-for="link in links">
        <NuxtLink :class="{'font-bold': isActive(link.url)}" :href="link.url">
          {{ link.title }}
        </NuxtLink>
      </li>
    </ul>
    <div>
      <LanguageSwitcher />
    </div>
  </div>
</template>

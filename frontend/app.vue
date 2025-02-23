<script setup lang="ts">
// Fetch & apply seomatic properties
useCraftSeoMatic()
</script>

<template>
  <NuxtLayout>
    <template #navigation>
      <Navigation />
    </template>
    <NuxtPage />
    <template #footer />
  </NuxtLayout>
</template>

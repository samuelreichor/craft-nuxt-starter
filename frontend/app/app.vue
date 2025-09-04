<script setup lang="ts">
// enables hot reloading for live previews
// if you want to stick with hard reloads, you need to enable the refresh checkbox in the preview targets in the sections.
// As described here https://samuelreichor.at/blogs/craft-preview-hr-nuxt#disable-auto-refresh
if (useCraftPreview().livePreview) {
  onMounted(() => {
    window.addEventListener('message', async (e) => {
      if (e.data !== 'entry:live-preview:updated') {
        return
      }

      try {
        await refreshNuxtData()
      }
      catch (e) {
        console.error(e)
      }
    })
  })
}
</script>

<template>
  <NuxtPage />
</template>

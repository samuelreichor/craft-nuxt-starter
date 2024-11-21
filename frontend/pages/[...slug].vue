<script setup lang="ts">
  import { CraftNotImplemented, type Config } from 'vue-craftcms'
  import Home from '~/templates/pages/home.vue';
/*  import News from '~/templates/pages/news.vue'; */

  import Headline from '~/templates/components/headline.vue'

  // Map your Craft CMS data to your vue components and pages
  const mapping: Config = {
    pages: {
      'home:entry_default': Home,
      'news:entry_default': CraftNotImplemented,
    },
    components: {
      'block_imageText': CraftNotImplemented,
      'block_author': CraftNotImplemented,
      'block_headline': Headline,
    }
  };

  // Get current uri and fetch current entry
  const route = useRoute()
  const uri = route.params.slug.length > 0 ? route.params.slug : '__home__';
  const { data, error } = await useCraftQuery('entries').uri(uri).one()

  if(error.value) {
    console.error(error.value)
  }
</script>

<template>
  <div>
    <CraftPage v-if="data" :config="mapping" :content="data" />
  </div>
</template>

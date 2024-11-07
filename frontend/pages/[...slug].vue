<script setup lang="ts">
  import { CraftNotImplemented, type Config } from 'vue-craftcms'
  import Home from '~/templates/pages/home.vue';
  import News from '~/templates/pages/news.vue';
/*   import Error404 from '~/templates/pages/404.vue' */

  import Headline from '~/templates/components/headline.vue'

  const mapping: Config = {
    pages: {
      'home': Home,
      'news': News,
    },
    components: {
      'block_imageText': CraftNotImplemented,
      'block_headline': Headline,
    }
  };

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

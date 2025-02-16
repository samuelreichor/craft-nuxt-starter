<script setup lang="ts">
  import { CraftNotImplemented, type Config } from 'vue-craftcms'
  import { type SiteMap} from "~/utils/helper";
  // Pages
  import Home from '~/templates/pages/home.vue';

  // Components
  import ImageText from '~/templates/components/ImageText.vue';
  import RichText from "~/templates/components/RichText.vue";
  import Headline from "~/templates/components/Headline.vue"
  import Authors from "~/templates/components/Authors.vue"


  // Map your Craft CMS data to your vue components and pages
  const mapping: Config = {
    pages: {
      'home:entry_default': Home,
      'news:entry_default': CraftNotImplemented,
    },
    components: {
      'block_imageText': ImageText,
      'block_richText': RichText,
      'block_author': Authors,
      'block_headline': Headline,
    }
  };

  const absoluteUrl = useRequestURL().href;
  const currentSite = inject<SiteMap>('currentSite')!;
  const uri = getSiteUri(absoluteUrl, currentSite.origin)
  const { data, error } = await useCraftQuery('entries').uri(uri).site(currentSite.handle).one()

  if(error.value) {
    console.error(error.value)
  }
</script>

<template>
  <CraftPage v-if="data" :config="mapping" :content="data" />
</template>

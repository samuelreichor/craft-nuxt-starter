<script setup lang="ts">
  import type {SiteMap} from "~/utils/helper";

  const runtimeConfig = useRuntimeConfig()

  const siteMap: SiteMap = {
    en: runtimeConfig.public.primarySiteUrl,
    de: runtimeConfig.public.primarySiteUrlDe,
    es: runtimeConfig.public.primarySiteUrlEs,
  } as const;

  const absoluteUrl = useRequestURL().href;
  const currentSite = getCurrentSite(absoluteUrl, siteMap)
  provide('currentSite', currentSite);
</script>

<template>
  <NuxtLayout>
    <template #navigation>
    </template>
    <NuxtPage/>
    <template #footer>
    </template>
  </NuxtLayout>
</template>

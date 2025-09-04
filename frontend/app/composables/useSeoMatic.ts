import { useCraftPreview } from '~/composables/useCraftPreview'

export function useSeoMatic() {
  // no need to set seo information when in live previewing
  if (useCraftPreview().livePreview) {
    return
  }
  const { data: seoData, error } = useCraftSeoMatic()

  if (error.value) {
    console.error(error.value)
  }

  const currentSite = useCraftCurrentSite()
  const title = computed(() => seoData.value?.title ?? '')
  const meta = computed(() => seoData.value?.metaTags ?? [])
  const link = computed(() => seoData.value?.linkTags ?? [])
  const jsonLd = computed(() => seoData.value?.jsonLd ?? {})
  const lang = computed(() => currentSite.value.lang)

  useHead({
    htmlAttrs: {
      lang,
    },
    title,
    meta,
    link,
    script: [
      {
        type: 'application/ld+json',
        innerHTML: jsonLd,
      },
    ],
  })
}

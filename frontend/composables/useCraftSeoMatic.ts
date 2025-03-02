import type { CraftSite } from 'vue-craftcms'

type MetaTag = { content?: string, name?: string, property?: string }
type MetaLink = { href: string, rel: string, hreflang?: string }
type SeoData = {
  MetaTitleContainer: { title?: { title: string } }
  MetaTagContainer: Record<string, MetaTag | MetaTag[]>
  MetaLinkContainer: Record<string, MetaLink | MetaLink[]>
  MetaJsonLdContainer: Record<string, unknown>
}

export function useCraftSeoMatic(uri?: string | Ref<string>, site?: CraftSite | Ref<CraftSite>) {
  const { baseUrl, siteMap } = useRuntimeConfig().public.craftcms

  if (siteMap.length === 0) {
    throw createError({
      statusCode: 500,
      statusMessage: 'Please ensure that a valid sitemap is defined in your app.config.ts file.',
    })
  }

  const currentSite = site ? ref(site) : useCraftCurrentSite()
  const currentUri = uri ? ref(uri) : useCraftUri()

  if (!currentSite.value || !currentUri.value) {
    return
  }

  const apiEndpoint = computed(() =>
    `${baseUrl}/actions/seomatic/meta-container/all-meta-containers/?asArray=true&uri=${encodeURIComponent(currentUri.value)}&siteId=${currentSite.value.id}`,
  )

  const { data: seoMaticData, error } = useFetch(apiEndpoint, {
    transform: (seoMaticData: SeoData) => {
      if (!seoMaticData || typeof seoMaticData !== 'object') {
        console.error('Transformation of SEOmatic data failed, please verify that the SEOmatic endpoint is working correctly')
        return undefined
      }
      return {
        title: seoMaticData.MetaTitleContainer?.title?.title ?? '',
        metaTags: generateMetaTags(seoMaticData.MetaTagContainer),
        linkTags: generateLinkTags(seoMaticData.MetaLinkContainer),
        jsonLd: seoMaticData.MetaJsonLdContainer ?? {},
      }
    },
  })

  if (error.value) {
    console.error(error.value)
  }

  function generateMetaTags(metaTagContainer: Record<string, MetaTag | MetaTag[]>) {
    return Object.entries(metaTagContainer || {}).flatMap(([key, tag]) => {
      if (!tag || typeof tag !== 'object') return []
      if (Array.isArray(tag) && tag.length === 0) return []

      if (Array.isArray(tag)) {
        return tag.map(item => ({
          hid: `${key}-${item.content ?? ''}`,
          name: item.name ?? undefined,
          property: item.property ?? undefined,
          content: item.content ?? undefined,
        }))
      }

      return [{
        hid: key,
        name: tag.name ?? undefined,
        property: tag.property ?? undefined,
        content: tag.content ?? undefined,
      }]
    })
  }

  function generateLinkTags(linkTagContainer: Record<string, MetaLink | MetaLink[]>) {
    return Object.entries(linkTagContainer || {}).flatMap(([, tag]) => {
      if (!tag || typeof tag !== 'object') return []
      if (Array.isArray(tag) && tag.length === 0) return []

      if (Array.isArray(tag)) {
        return tag.map(item => ({
          rel: item.rel,
          href: item.href,
          hreflang: item.hreflang ?? undefined,
        }))
      }

      return [{
        rel: tag.rel,
        href: tag.href,
        hreflang: tag.hreflang ?? undefined,
      }]
    })
  }

  watchEffect(() => {
    useHead({
      htmlAttrs: {
        lang: currentSite.value.lang ?? 'en',
      },
      title: seoMaticData.value?.title,
      meta: seoMaticData.value?.metaTags,
      link: seoMaticData.value?.linkTags,
      script: [
        {
          type: 'application/ld+json',
          innerHTML: JSON.stringify(seoMaticData.value?.jsonLd),
        },
      ],
    })
  })
}

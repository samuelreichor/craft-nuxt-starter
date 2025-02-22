import type { CraftSite } from 'vue-craftcms'

type MetaTag = { content?: string; name?: string; property?: string }
type MetaLink = { href: string; rel: string; hreflang?: string }
type SeoData = {
  MetaTitleContainer?: { title?: { title: string } }
  MetaTagContainer?: Record<string, MetaTag | MetaTag[]>
  MetaLinkContainer?: Record<string, MetaLink | MetaLink[]>
  MetaJsonLdContainer?: Record<string, any>
}

export async function useCraftSeoMatic(uri?: string | Ref<string>, site?: CraftSite | Ref<CraftSite>) {
  const {baseUrl, siteMap} = useRuntimeConfig().public.craftcms
  if (siteMap.length === 0) {
    throw createError({
      statusCode: 500,
      statusMessage: 'Please ensure that a valid sitemap is defined in your app.config.ts file.',
    })
  }
  const currentSite = site ? ref(site) : useCraftCurrentSite()
  const currentUri = uri? ref(uri) : useCraftUri()

  if (!currentSite.value || !currentUri.value) {
    return;
  }

  const apiEndpoint = computed(() =>
      `${baseUrl}/actions/seomatic/meta-container/all-meta-containers/?asArray=true&uri=${encodeURIComponent(currentUri.value)}&siteId=${currentSite.value.id}`
  )

  const {data, error} = await useFetch<SeoData>(apiEndpoint);

  if (error.value) {
    console.error(error.value)
  }

  watchEffect(() => {
    if (!data.value) return;

    const title = data.value.MetaTitleContainer?.title?.title || '';

    const metaTags = Object.entries(data.value.MetaTagContainer || {})
      .flatMap(([key, tag]) => {
        if (!tag || typeof tag !== 'object') return [];
        if (Array.isArray(tag) && tag.length === 0) return [];

        if (Array.isArray(tag)) {
          return tag.map(item => ({
            hid: key + '-' + (item.content ?? ''),
            name: item.name ?? undefined,
            property: item.property ?? undefined,
            content: item.content ?? undefined
          }));
        }

        return [{
          hid: key,
          name: tag.name ?? undefined,
          property: tag.property ?? undefined,
          content: tag.content ?? undefined
        }];
      });

    const linkTags = Object.entries(data.value.MetaLinkContainer || {})
      .flatMap(([, tag]) => {
        if (!tag || typeof tag !== 'object') return [];
        if (Array.isArray(tag) && tag.length === 0) return [];

        if (Array.isArray(tag)) {
          return tag.map(item => ({
            rel: item.rel,
            href: item.href,
            hreflang: item.hreflang ?? undefined
          }));
        }

        return [{
          rel: tag.rel,
          href: tag.href,
          hreflang: tag.hreflang ?? undefined
        }];
      });

    const jsonLd = data.value.MetaJsonLdContainer || {};

    useHead({
      htmlAttrs: {
        lang: currentSite.value.lang ?? 'en',
      },
      title,
      meta: metaTags,
      link: linkTags,
      script: [
        {
          type: 'application/ld+json',
          innerHTML: JSON.stringify(jsonLd)
        }
      ]
    });
  });
}

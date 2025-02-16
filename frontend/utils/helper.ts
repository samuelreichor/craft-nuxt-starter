export type Prettify<T> = {
  [K in keyof T]: T[K];
} & {};

export type SiteMap = Record<string, string>;
export function getCurrentSite(url: string, siteMap: SiteMap): SiteMap {
  const entries = Object.entries(siteMap);
  const sortedEntries = entries.sort(([, originA], [, originB]) => originB.length - originA.length);
  const normUrl = normalizeUrl(url);
  for (const [handle, origin] of sortedEntries) {
    if (normUrl.startsWith(normalizeUrl(origin))) {
      return {handle, origin};
    }
  }

  const [defaultHandle, defaultOrigin] = sortedEntries[0];
  return { handle: defaultHandle, origin: defaultOrigin };
}

export function getSiteUri(url: string, currentOrigin: string): string {
  const normUrl = normalizeUrl(url);
  const uri = normUrl
      .replace(normalizeUrl(currentOrigin), '')
      .split('?')[0]
      .replace(/^\/+/, '');
  if (uri === '') {
    return '__home__'
  }
  return uri;
}

function normalizeUrl(url:string) {
  return url
      .replace(/^https?:\/\//, '')
      .replace(/^www\./, '')
}

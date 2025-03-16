import type { EntryStatusString } from 'js-craftcms-api'

export type EntryRelation = {
  title: string
  slug: string
  url: string
  id: number
}

export type MetadataEntry = {
  cpEditUrl: string
  entryType: string
  id: number
  sectionId: number
  siteId: number
  slug: string
  status: EntryStatusString
  uri: string
  url: string
  fullUri: string
}

export type DefaultEntry = {
  metadata: MetadataEntry
  [key: string]: unknown
}

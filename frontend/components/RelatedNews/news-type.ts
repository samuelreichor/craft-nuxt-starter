import type { MetadataEntry } from '~/types/craftcms'
import type { ImageObject } from '~/components/Image/image-types'

export type NewsEntry = {
  metadata: MetadataEntry
  image: ImageObject
  richText: string
  headline: string
}

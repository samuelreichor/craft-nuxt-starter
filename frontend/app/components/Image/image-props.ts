import type { CraftAssetRatioValue, ObjectFitValue } from './image-types'
import type { CraftAsset } from '~/types/base'

export const sharedImageProps = {
  image: {
    type: Object as PropType<CraftAsset>,
    required: true,
  },
  lazy: {
    type: Boolean,
    default: () => true,
  },
  objectFit: {
    type: String as PropType<ObjectFitValue>,
    default: () => 'contain',
  },
  transform: {
    type: String as PropType<CraftAssetRatioValue>,
    default: () => 'auto',
  },
}

export const captionProps = {
  caption: {
    type: String,
    default: () => '',
  },
  captionClasses: {
    type: String,
    default: () => '',
  },
}

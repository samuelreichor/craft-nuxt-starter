import type { ImageObject, ImageRatio, ObjectFitValue } from './image-types'

export const sharedImageProps = {
  image: {
    type: Object as PropType<ImageObject>,
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
    type: String as PropType<ImageRatio>,
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

import type { Prettify } from '~/types/helper'

export type Metadata = {
  id: number
  filename: string
  kind: string
  size: number
  mimeType: string
  extension: string
  cpEditUrl: string
  dateCreated: {
    date: string
    timezone_type: number
    timezone: string
  }
  dateUpdated: {
    date: string
    timezone_type: number
    timezone: string
  }
}

export type ImageFormats = {
  'auto': string
  '1:1': string
  '3:2': string
  '2:3': string
  'dominantColor': string
}

export type ImageRatio = Prettify<keyof ImageFormats>

export type ImageBaseObject = {
  metadata: Prettify<Metadata>
  height: number
  width: number
  focalPoint: {
    x: number
    y: number
  }
  src: string
  title: string
}

export type ImageObject = Prettify<
  ImageBaseObject & {
    altText?: string
    caption?: string
    srcSets: Prettify<ImageFormats>
  }
>

export type ObjectFitValue = 'contain' | 'cover' | 'fill'

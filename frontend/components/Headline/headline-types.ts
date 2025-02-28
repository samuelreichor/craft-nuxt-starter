export type HeadlineValue = 'h1' | 'h2' | 'h3' | 'h4' | 'h5' | 'h6'
export type HeadlineLabel = 'H1' | 'H2' | 'H3' | 'H4' | 'H5' | 'H6'

export type HeadlineTag = {
  label: HeadlineLabel
  value: HeadlineValue
  selected: boolean
  valid: boolean
}

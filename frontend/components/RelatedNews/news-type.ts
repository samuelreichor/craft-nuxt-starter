import type { CraftPageEntryNews } from '~/types/base'

export type NewsEntry = Pick<CraftPageEntryNews, 'metadata' | 'image' | 'headline' | 'richText'>

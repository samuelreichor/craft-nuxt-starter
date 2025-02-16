import type {ImageObject} from '~/components/Image/image-types';

export type AuthorObject = {
  metaData: {
    id: number,
    status: string,
  },
  username: string,
  email: string,
  fullName: string | null,
  photo: ImageObject | null,
}

export function useCraftPreview() {
  const { query } = useRoute()
  return {
    livePreview: query['x-craft-live-preview'],
    preview: query['x-craft-preview'],
    token: query['token'],
  }
}

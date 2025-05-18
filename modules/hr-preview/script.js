Garnish.on(Craft.Preview, 'beforeUpdateIframe', function (event) {
  if (!event.refresh) {
    // Once the content has been changed, fire a postMessage event with a live preview key,
    // but scope the broadcast to our site for security purposes
    event.target.$iframe[0].contentWindow.postMessage(
        'entry:live-preview:updated',
        event.previewTarget.url
    )
  }
})

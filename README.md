# sure_headless-mailbox
Free Open Source, Headless Mailbox for everyone to customize your NUI

# Usage
## NUI
```typescript
window.addEventListener('message', (event: MessageEvents) => {
    const type = event.data.type

    if (type === 'update-mails') {
        const mails = event.data.mails
        ...
    } else if (type === 'add-mail-index-to-history') {
        const index = event.data.index
        ...
    } else if (type === 'update-history-indexes') {
        const indexes = event.data.indexes
        ...
    }
})
```

## Client Commands
### Debug All Data
`sure_mb_debug`
### Claim Items
`sure_mb_claim [index]`
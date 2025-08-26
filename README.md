# sure_headless-mailbox
Free Open Source, Headless Mailbox for everyone to customize your NUI

**VERSION** `1.0.0`
**DISCORD** [OUR DISCORD](https://discord.gg/5CF2Z2JZWs)

## Core Features
- Mailbox with title, sender, sent_date, content, and items to receive
- Use JSON as storage
- Optimized net packet

## Example
```lua
--- Table key
['mail_entry_1'] = {
    title = 'This is a title',
    sender = 'Sure Headless',
    sent_date = '8/26/2025',
    content = [[
        Content
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
        </ul>
    ]],
    receives = {
        { type = 'item', name = 'painkiller', count = 1 },
        { type = 'account', name = 'money', count = 500 }
    }
}
```

## Usage
### NUI
Reference type (typescript) from `./types/types.ts`
And you also need to add for visibility of NUI.
```typescript
window.addEventListener('message', (event: MessageEvent<MessageEventsFromNUI>) => {
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

### Client Commands
#### Debug All Data
`sure_mb_debug`
#### Claim Items
`sure_mb_claim [index]`
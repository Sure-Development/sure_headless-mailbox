export interface Mail {
    title: string
    sender: string
    sent_date: string
    content: string
    receives: Item[]
}

export interface Item {
    type: 'item' | 'account'
    name: string
    count: number
}

export interface AllMails {
    [key: string]: Mail
}

interface MessageUpdateMails {
    type: 'update-mails'
    mails: AllMails
}

interface MessageAddMailIndexToHistory {
    type: 'add-mail-index-to-history'
    index: string
}

interface MessageUpdateHistoryIndexes {
    type: 'update-history-indexes'
    indexes: string[]
}

export type MessageEventsFromNUI = MessageUpdateMails | MessageAddMailIndexToHistory | MessageUpdateHistoryIndexes
--- @diagnostic disable: lowercase-global
p = promise.new()
--- @type string[]
indexes = {}

CreateThread(function()
    while not ESX.IsPlayerLoaded() do
        Wait(500)
    end

    Citizen.Await(p) --- Disable this line if you don't have NUI

    TriggerServerEvent('sure_headless-mailbox:loadHistoryIndexes')

    SendNUIMessage({
        type = 'update-mails',
        mails = MAILS
    })
end)

--- @param results string[]
RegisterNetEvent('sure_headless-mailbox:getHistoryIndexes', function(results)
    indexes = results

    SendNUIMessage({
        type = 'update-history-indexes',
        indexes = indexes
    })

    print(ESX.DumpTable(indexes))
end)

--- @param index string
RegisterNetEvent('sure_headless-mailbox:addMailIndexToHistory', function(index)
    table.insert(indexes, index)

    SendNUIMessage({
        type = 'add-mail-index-to-history',
        index = index
    })
end)
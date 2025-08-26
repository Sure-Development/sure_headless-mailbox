--- @type Storage
local players = {}

RegisterNetEvent('sure_headless-mailbox:loadHistoryIndexes', function()
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer then
        local identifier = xPlayer.getIdentifier()
        if players[identifier] then
            local results = {}
            for index, value in pairs(players[identifier]) do
                if value then
                    table.insert(results, index)
                end
            end

            TriggerClientEvent('sure_headless-mailbox:getHistoryIndexes', playerId, results)
        end
    end
end)

--- @param index string
RegisterNetEvent('sure_headless-mailbox:claimItems', function(index)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local config = MAILS[index]

    if xPlayer and config then
        local identifier = xPlayer.getIdentifier()
        if players[identifier] == nil then
            players[identifier] = {}
        end

        local player = players[identifier]
        if player[index] == nil then
            local funcs = {
                account = 'addAccountMoney',
                item = 'addInventoryItem'
            }

            for _, v in ipairs(config.receives) do
                xPlayer[funcs[v.type]](v.name, v.count)
            end

            player[index] = true
            TriggerClientEvent('sure_headless-mailbox:addMailIndexToHistory', playerId, index)
        else
            TriggerEvent('mythic_notify:client:SendAlert', playerId, {
                type = 'info',
                text = 'You already claimed this mail!'
            })
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        local previousData = json.decode(LoadResourceFile(resource, 'storage.json')) --[[ @as Storage ]]
        players = previousData

        local function save()
            SetTimeout(30000, function()
                SaveResourceFile(resource, 'storage.json', json.encode(players), -1)
                save()
            end)
        end

        save()
    end
end)
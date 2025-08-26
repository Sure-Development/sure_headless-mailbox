--[[
    You must fetch to this endpoint like

    fetch(`https://${GetParentResourceName()}/ready`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    })
        .then(resp => resp.json())
        .then(resp => console.log(resp))
--]]
RegisterNUICallback('ready', function(_, cb)
    p:resolve()
    cb({ status = 'ok' })
end)

RegisterNUICallback('claim-items', function(data, cb)
    local index = data.index
    if type(index) ~= 'string' then
        return error(('your payload is not valid structure, expected %s, received %s'):format('string', type(index)))
    end

    if MAILS[index] == nil then
        return error(('your index %s of mailbox does not exists'):format(index))
    end

    TriggerServerEvent('sure_headless-mailbox:claimItems', index)

    cb({ status = 'ok' })
end)
local divider = '------------------------------------------------------'

--- @param array table
--- @param value any
--- @return integer?
local function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    
    return nil
end

RegisterCommand('sure_mb_debug', function()
    print(divider)

    print('#MAILS')
    print(ESX.DumpTable(MAILS))

    print(divider)

    print('#HISTORY-INDEXES')
    print(ESX.DumpTable(indexes))
end, true)

RegisterCommand('sure_mb_claim', function(_, args)
    local targetIndex = args[1]
    print(divider)

    if targetIndex ~= nil and MAILS[targetIndex] then
        local existingIndex = indexOf(indexes, targetIndex)
        print(existingIndex)

        if existingIndex == nil then
            TriggerServerEvent('sure_headless-mailbox:claimItems', targetIndex)
            print('#OPERATION')
            print(('Call net event with index %s'):format(targetIndex))
        else
            print('#INFO')
            print(('You are already claimed this index (%s)'):format(targetIndex))
        end
    else
        print('#ERROR')
        print('Please send a valid mail index (see at config/mails.lua)')
    end

    print(divider)
end, true)
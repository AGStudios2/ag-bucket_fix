-- Force all players into bucket 0 on connect and spawn
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    SetPlayerRoutingBucket(src, 0)
end)

AddEventHandler('playerSpawned', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
end)

-- Admin command to fix a specific player's routing bucket
QBCore.Commands.Add("fixplayer", "Admin: Fix a player's routing bucket", {{name="id", help="Player ID"}}, true, function(source, args)
    local target = tonumber(args[1])
    if target and GetPlayerName(target) then
        SetPlayerRoutingBucket(target, 0)
        TriggerClientEvent('QBCore:Notify', target, "Your routing bucket has been reset by an admin!", "success")
        TriggerClientEvent('QBCore:Notify', source, "Player bucket reset successfully!", "success")
    else
        TriggerClientEvent('QBCore:Notify', source, "Invalid player ID", "error")
    end
end)

-- Automatic bucket sync for admin teleports
RegisterNetEvent('bucket_fix:syncBucket', function(target)
    local src = source
    if IsPlayerAceAllowed(src, "admin") then
        if target and GetPlayerName(target) then
            local bucket = GetPlayerRoutingBucket(target)
            SetPlayerRoutingBucket(src, bucket)
        end
    end
end)

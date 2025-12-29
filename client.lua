-- Fail-safe: constantly ensure the player stays in bucket 0 if not in an instance
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) -- every 5 seconds
        local ped = PlayerPedId()
        local bucket = GetPlayerRoutingBucket(PlayerId())
        if bucket ~= 0 then
            SetPlayerRoutingBucket(PlayerId(), 0)
            -- optional: notify admin if bucket was reset
            -- TriggerEvent('QBCore:Notify', "Your routing bucket was automatically reset.", "success")
        end
    end
end)

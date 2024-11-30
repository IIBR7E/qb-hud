local QBCore = exports['qb-core']:GetCoreObject()                


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        local playerPed = PlayerPedId()

        local health = GetEntityHealth(player)
        local maxHealth = GetPedMaxHealth(player)

        local ratio = (health - 100) * 100 / (maxHealth - 100)
        local HasWeap, WeapHash = GetCurrentPedWeapon(playerPed), GetSelectedPedWeapon(playerPed)


        local ammo

        if(IsPedArmed(playerPed, 4)) then _, ammo = GetAmmoInClip(playerPed, WeapHash) end
        local istalking = NetworkIsPlayerTalking(PlayerId())
        SendNUIMessage({
            action = "update",
            health = ratio,
            armour = GetPedArmour(player),
            weapon = HasWeap and WeapHash and Config.Weapons[WeapHash].Image or false,
            ammo = ammo,
            voice = NetworkIsPlayerTalking(PlayerId()),       
         })
    end
end)


RegisterNuiCallback('getAvatars', function(data, cb)
    QBCore.Functions.TriggerCallback('server:getAvatar', function(avatar)
        -- print(avatar)
        cb(avatar)
    end)
end)
-- 
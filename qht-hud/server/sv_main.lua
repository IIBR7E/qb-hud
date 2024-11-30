local QBCore = exports["qb-core"]:GetCoreObject()


local Token = "Your Bot Token"

QBCore.Functions.CreateCallback('server:getAvatar', function(source, cb)
    local src = source
    local DiscordID = string.gsub(QBCore.Functions.GetIdentifier(src, 'discord'), "discord:", "")
    local avatar = nil
    PerformHttpRequest("https://discord.com/api/users/" .. DiscordID, function(code, result, idk)
        local data = json.decode(result)
        if data and data.avatar then
            avatar = "https://cdn.discordapp.com/avatars/" .. DiscordID .. "/" .. data.avatar .. ".png"
            cb(avatar)
        end
    end, 'GET', '', { ["Authorization"] = "Bot " .. Token, ["Content-Type"] = "application/json" })
    Wait(250)
    cb(avatar)
end)

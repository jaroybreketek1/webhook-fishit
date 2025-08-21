-- CONFIG
local webhookUrl = "https://discord.com/api/webhooks/1407782433138544792/fWhrTFwFMOZyQkVy3wUKlHdVjzRejrLoFP8cVG__yuRrSZ88b83zQLbkLOA7g__rs32I"

-- SERVICE
local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer

-- FUNGSI KIRIM
local function sendWebhook(msg)
    local data = {["content"] = msg}
    local json = HttpService:JSONEncode(data)

    (syn and syn.request or http_request)({
        Url = webhookUrl,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = json
    })
end

-- EVENT DAPET IKAN
local fishEvent = game.ReplicatedStorage:WaitForChild("FishCaught") -- cek nama RemoteEvent bener2 ya

fishEvent.OnClientEvent:Connect(function(fishName, fishRarity, fishValue)
    sendWebhook("🎣 "..player.Name.." dapet ikan: **"..fishName.."** | Rarity: *"..fishRarity.."* | Value: 💰"..tostring(fishValue))
end)

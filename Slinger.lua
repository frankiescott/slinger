local active = false
local phrases = {"wtb port", "lf port"}

local Slinger = CreateFrame("Frame", "Slinger")

local function OnEvent(self, event, ...)
	local dispatch = self[event]

	if dispatch then
		dispatch(self, ...)
	end
end

Slinger:SetScript("OnEvent", OnEvent)
Slinger:RegisterEvent("CHAT_MSG_CHANNEL")
Slinger:RegisterEvent("ADDON_LOADED")

function Slinger:ADDON_LOADED(addonName)
    active = false
end

function Slinger:CHAT_MSG_CHANNEL(msg, author, language, channel, ...)
    message = string.lower(msg)
    --if channel == "2. Trade - City" then
        --print("A user messaged trade")
    --end
    if channel == "1. General - Stormwind City" then
        for i, phrase in ipairs(phrases) do
            if string.match(message, phrase) then
                SendChatMessage("I can port you!", "WHISPER", "Common", author);
                InviteUnit(author)
            end
        end
    end
end


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
Slinger:RegisterEvent("CHAT_MSG_SAY")
Slinger:RegisterEvent("CHAT_MSG_YELL")
function Slinger:ADDON_LOADED(addonName)
    active = false
end

function Slinger:CHAT_MSG_CHANNEL(msg, author, language, channel, ...)
    message = string.lower(msg)

    if channel == "1. General - Stormwind City" then
        parseLocal(message, author)
    end

    if channel == "5. FrankupTest" then
        parseLocal(message, author)
    end
end

function Slinger:CHAT_MSG_SAY(msg, author, ...)
    parseLocal(msg, author)
end

function Slinger:CHAT_MSG_YELL(msg, author, ...)
    parseLocal(msg, author)
end

function parseLocal(msg, author)
    for i, phrase in ipairs(phrases) do
        if string.match(message, phrase) then
            SendChatMessage("I can port you!", "WHISPER", "Common", author);
            InviteUnit(author)
        end
    end
end


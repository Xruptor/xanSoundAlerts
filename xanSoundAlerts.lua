--Simple addon that plays a sound if health and or mana is low, based on predefined threshold levels

local f = CreateFrame("frame","xanSoundAlerts",UIParent)
f:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)

local debugf = tekDebug and tekDebug:GetFrame("xanSoundAlerts")
local function Debug(...)
    if debugf then debugf:AddMessage(string.join(", ", tostringall(...))) end
end

--only play the sound once during low health/mana then reset
local lowHealth = false
local lowMana = true

--edit these to your liking
local lowHealthThreshold = 0.35 --set the percentage threshold for low health
local lowManaThreshold = 0.35 --set the percentage threshold for low mana

----------------------
--      Enable      --
----------------------
	
function f:PLAYER_LOGIN()

	f:UnregisterEvent("PLAYER_LOGIN")
	f.PLAYER_LOGIN = nil
	
	f:RegisterEvent("UNIT_HEALTH")
	f:RegisterEvent("UNIT_MANA")

	local ver = tonumber(GetAddOnMetadata("xanSoundAlerts","Version")) or 'Unknown'
	DEFAULT_CHAT_FRAME:AddMessage("|xanSoundAlerts|r [v|cFFDF2B2B"..ver.."|r] loaded.")
end

function f:UNIT_HEALTH()
	if ((UnitHealth("player") / UnitHealthMax("player")) <= lowHealthThreshold) then
		if (not lowHealth) then
			PlaySoundFile("Interface\\AddOns\\xanSoundAlerts\\sounds\\LowHealth.ogg", "Master")
			lowHealth = true
		end
	else
		lowHealth = false
	end
end

function f:UNIT_MANA()
	if ((UnitPower("player") / UnitPowerMax("player")) <= lowManaThreshold) then
		if (not lowMana) then
			PlaySoundFile("Interface\\AddOns\\xanSoundAlerts\\sounds\\LowMana.ogg", "Master")
			lowMana = true
		end
	else
		lowMana = false
	end
end

if IsLoggedIn() then f:PLAYER_LOGIN() else f:RegisterEvent("PLAYER_LOGIN") end

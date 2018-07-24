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
	f:RegisterEvent("UNIT_POWER_UPDATE")
	
	local ver = tonumber(GetAddOnMetadata("xanSoundAlerts","Version")) or 'Unknown'
	DEFAULT_CHAT_FRAME:AddMessage("|cFF99CC33xanSoundAlerts|r [v|cFFDF2B2B"..ver.."|r] loaded.")
	
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

--https://github.com/Gethe/wow-ui-source/blob/beta/FrameXML/UnitFrame.lua#L24
-- SPELL_POWER_MANA            0       "MANA"
-- SPELL_POWER_RAGE            1       "RAGE"
-- SPELL_POWER_FOCUS           2       "FOCUS"
-- SPELL_POWER_ENERGY          3       "ENERGY"
-- SPELL_POWER_COMBO_POINTS    4       "COMBO_POINTS"
-- SPELL_POWER_RUNES           5       "RUNES"
-- SPELL_POWER_RUNIC_POWER     6       "RUNIC_POWER"
-- SPELL_POWER_SOUL_SHARDS     7       "SOUL_SHARDS"
-- SPELL_POWER_LUNAR_POWER     8       "LUNAR_POWER"
-- SPELL_POWER_HOLY_POWER      9       "HOLY_POWER"
-- SPELL_POWER_ALTERNATE_POWER 10      ???
-- SPELL_POWER_MAELSTROM       11      "MAELSTROM"
-- SPELL_POWER_CHI             12      "CHI"
-- SPELL_POWER_INSANITY        13      "INSANITY"
-- SPELL_POWER_OBSOLETE        14      ???
-- SPELL_POWER_OBSOLETE2       15      ???
-- SPELL_POWER_ARCANE_CHARGES  16      "ARCANE_CHARGES"
-- SPELL_POWER_FURY            17      "FURY"
-- SPELL_POWER_PAIN            18      "PAIN"

--only worry about mana, don't care about special power types really for now
function f:UNIT_POWER_UPDATE()
	if ((UnitPower("player", SPELL_POWER_MANA) / UnitPowerMax("player", SPELL_POWER_MANA)) <= lowManaThreshold) then
		if (not lowMana) then
			PlaySoundFile("Interface\\AddOns\\xanSoundAlerts\\sounds\\LowMana.ogg", "Master")
			lowMana = true
		end
	else
		lowMana = false
	end
end

if IsLoggedIn() then f:PLAYER_LOGIN() else f:RegisterEvent("PLAYER_LOGIN") end

local ADDON_NAME, private = ...
local L = private:NewLocale("enUS", true)
if not L then return end

L.ChkBtnHealthOn = "xanSoundAlerts: Health sound notifications now [|cFF99CC33ON|r]"
L.ChkBtnHealthOff = "xanSoundAlerts: Health sound notifications now [|cFF99CC33OFF|r]"
L.ChkBtnHealthInfo = "Enable health sound notifications."

L.ChkBtnManaOn = "xanSoundAlerts: Mana sound notifications now [|cFF99CC33ON|r]"
L.ChkBtnManaOff = "xanSoundAlerts: Mana sound notifications now [|cFF99CC33OFF|r]"
L.ChkBtnManaInfo = "Enable Mana sound notifications."

L.ChkBtnOtherInfo = "Enable additional [|cff40e0d0%s|r] sound notifications."
L.ChkBtnOtherOn = "xanSoundAlerts: [|cff40e0d0%s|r] additional sound notifications now [|cFF99CC33ON|r]"
L.ChkBtnOtherOff = "xanSoundAlerts: [|cff40e0d0%s|r] additional sound notifications now [|cFF99CC33OFF|r]"

L.SecretWarn = "|cFF99CC33xanSoundAlerts|r: !!WARNING!!\nBlizzard \"secret values\" are restricting access to health/power for (Retail/Midnight 12.0+) clients. Sound alerts may not fire while values are hidden. There are no workarounds for this sorry!"

local ADDON_NAME, private = ...
local L = private:NewLocale("zhCN")
if not L then return end
L.SecretWarn = "|cFF99CC33xanSoundAlerts|r: !!警告!!\n暴雪的\"秘密值\"限制了（正式服/至暗之夜 12.0+）客户端对生命值/能量等数值的访问。当数值被隐藏时，声音警报可能不会触发。很抱歉，目前没有可用的绕过方式！"

L.ChkBtnHealthOn = "xanSoundAlerts: 低生命值声音警报 [|cFF99CC33开|r]"
L.ChkBtnHealthOff = "xanSoundAlerts: 低生命值声音警报 [|cFF99CC33关|r]"
L.ChkBtnHealthInfo = "启用低生命值声音警报"

L.ChkBtnManaOn = "xanSoundAlerts: 低法力值声音警报 [|cFF99CC33开|r]"
L.ChkBtnManaOff = "xanSoundAlerts: 低法力值声音警报 [|cFF99CC33关|r]"
L.ChkBtnManaInfo = "启用低法力值声音警报"

L.ChkBtnOtherInfo = "启用 [|cff40e0d0%s|r] 声音警报"
L.ChkBtnOtherOn = "xanSoundAlerts: 现在[|cff40e0d0%s|r] 声音警报 [|cFF99CC33开|r]"
L.ChkBtnOtherOff = "xanSoundAlerts: 现在[|cff40e0d0%s|r] 声音警报 [|cFF99CC33关|r]"

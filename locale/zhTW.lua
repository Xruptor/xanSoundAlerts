local ADDON_NAME, private = ...
local L = private:NewLocale("zhTW")
if not L then return end
L.SecretWarn = "|cFF99CC33xanSoundAlerts|r: !!警告!!\n暴雪的\"秘密值\"限制了（正式服/至暗之夜 12.0+）客戶端對生命值/能量等數值的存取。當數值被隱藏時，聲音警報可能不會觸發。很抱歉，目前沒有可用的繞過方式！"

L.ChkBtnHealthOn = "xanSoundAlerts: 低生命值聲音警報 [|cFF99CC33開|r]"
L.ChkBtnHealthOff = "xanSoundAlerts: 低生命值聲音警報 [|cFF99CC33關|r]"
L.ChkBtnHealthInfo = "啓用低生命值聲音警報"

L.ChkBtnManaOn = "xanSoundAlerts: 低法力值聲音警報 [|cFF99CC33開|r]"
L.ChkBtnManaOff = "xanSoundAlerts: 低法力值聲音警報 [|cFF99CC33關|r]"
L.ChkBtnManaInfo = "啓用低法力值聲音警報"

L.ChkBtnOtherInfo = "啓用 [|cff40e0d0%s|r] 聲音警報"
L.ChkBtnOtherOn = "xanSoundAlerts: 現在[|cff40e0d0%s|r] 声音警报 [|cFF99CC33開|r]"
L.ChkBtnOtherOff = "xanSoundAlerts: 現在[|cff40e0d0%s|r] 声音警报 [|cFF99CC33關|r]"

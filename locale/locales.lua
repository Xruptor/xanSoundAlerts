local ADDON_NAME, private = ...
if type(private) ~= "table" then
	private = {}
end

private._locales = private._locales or {
	current = (type(_G.GetLocale) == "function" and _G.GetLocale()) or "enUS",
	default = nil,
	locales = {},
}

function private:NewLocale(locale, isDefault)
	if type(locale) ~= "string" or locale == "" then return nil end
	local store = private._locales

	if isDefault then
		store.default = store.default or {}
		return store.default
	end

	if locale ~= store.current then
		return nil
	end

	store.locales[locale] = store.locales[locale] or {}
	return store.locales[locale]
end

function private:GetLocale()
	local store = private._locales
	local L = store.locales[store.current] or store.default or {}
	if store.default and L ~= store.default then
		return setmetatable(L, { __index = store.default })
	end
	return L
end

private.L = private.L or setmetatable({}, {
	__index = function(_, key)
		return (private:GetLocale() or {})[key]
	end,
})


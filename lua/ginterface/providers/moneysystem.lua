local self, info = GInterface.CreateInterfaceProvider ("MoneySystem", "MoneySystem")
info:SetPriority (0)
info:SetSingleton (true)

function self:ctor ()
	self.Players = {}
end

function self:AddPlayerMoney (steamID, deltamoney)
	if deltamoney == 0 then return end

	self.Players [steamID] = (self.Players [steamID] or 0) + deltamoney
	self:DispatchEvent ("PlayerMoneyChanged", steamID, self.Players [steamID])
end

function self:CanPlayerAfford (steamID, money, callback)
	self.Players [steamID] = self.Players [steamID] or 0
	callback (steamID, self.Players [steamID] >= money)
end

function self:GetPlayerMoney (steamID, callback)
	self.Players [steamID] = self.Players [steamID] or 0
	callback (steamID, self.Players [steamID])
end

function self:RemovePlayerMoney (steamID, deltamoney)
	if deltamoney == 0 then return end
	
	self.Players [steamID] = (self.Players [steamID] or 0) - deltamoney
	self:DispatchEvent ("PlayerMoneyChanged", steamID, self.Players [steamID])
end

function self:SetPlayerMoney (steamID, money)
	self.Players [steamID] = money
	self:DispatchEvent ("PlayerMoneyChanged", steamID, self.Players [steamID])
end
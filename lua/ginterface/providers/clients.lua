local self, info = GInterface.CreateInterfaceProvider ("Clients", "Clients")info:SetPriority (0)info:SetSingleton (true)function self:ctor ()	self.Cache = {}		if SERVER then		hook.Add ("PlayerInitialSpawn", "Clients", function (ply)			self:CreateClientForPlayer (ply)		end)				hook.Add ("PlayerDisconnected", "Clients", function (ply)			self:DispatchEvent ("ClientDisconnected", self:GetClientBySteamID (ply:SteamID ()))			self:GetClientBySteamID (ply:SteamID ()):OnPlayerDisconnected ()		end)	elseif CLIENT then		hook.Add ("OnEntityCreated", "Clients", function (ply)			if not ply:IsPlayer () then return end			self:CreateClientForPlayer (ply)		end)				hook.Add ("EntityRemoved", "Clients", function (ply)			if not ply:IsPlayer () then return end			local client = self:GetClientBySteamID (ply:SteamID ())			if not cleint then return end			self:DispatchEvent ("ClientDisconnected", self:GetClientBySteamID (ply:SteamID ()))			client:OnPlayerDisconnected ()		end)	end		for _, ply in ipairs (player.GetAll ()) do		self:CreateClientForPlayer (ply)	end		timer.Simple (10, function ()		for _, ply in ipairs (player.GetAll ()) do			self:CreateClientForPlayer (ply)		end	end)endfunction self:CreateClientForPlayer (ply)	local steamID = ply:SteamID ()	local client = self.Cache [steamID] or GInterface.CreateInterface ("Client", nil, steamID, ply:Name ())	self.Cache [steamID] = client	client:OnPlayerConnected (GInterface.CreateInterface ("Servers"):GetCurrentServer (), ply)endfunction self:GetClientBySteamID (steamID)	if CLIENT and game.SinglePlayer () and steamID == "STEAM_0:0:0" then		steamID = LocalPlayer ():SteamID ()	end	return self.Cache [steamID]endfunction self:GetClientFromPlayer (ply)	return self:GetClientBySteamID (ply:SteamID ())end
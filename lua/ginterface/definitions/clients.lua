local self = GInterface.CreateDefinition ("Clients")self:AddEvent ("ClientDisconnected")	:AddArgument ("Client", "client")		:End ()self:AddMethod ("GetClientBySteamID")	:AddArgument ("string", "steamID")		:End ()	:SetReturnType ("Client")self:AddMethod ("GetClientFromPlayer")	:AddArgument ("player", "player")		:End ()	:SetReturnType ("Client")
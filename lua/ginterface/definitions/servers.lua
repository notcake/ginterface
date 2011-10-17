local self = GInterface.CreateDefinition ("Servers")

self:AddMethod ("GetCurrentServer")
	:SetReturnType ("Server")
self:AddMethod ("GetServerByIP")
	:AddArgument ("string", "ip")	:End ()
	:AddArgument ("number", "port")	:End ()
	:SetReturnType ("Server")
local self = GInterface.CreateDefinition ("Server")

self:AddMethod ("GetName")
	:SetReturnType ("string")
self:AddMethod ("GetHostName")
	:SetReturnType ("string")
self:AddMethod ("GetIP")
	:SetReturnType ("string")
self:AddMethod ("GetPort")
	:SetReturnType ("number")
self:AddMethod ("IsCurrentServer")
	:SetReturnType ("boolean")
local self = GInterface.CreateDefinition ("ChatChannel")

self:AddMethod ("GetID")
	:SetReturnType ("string")
self:AddMethod ("GetName")
	:SetReturnType ("string")
self:AddMethod ("GetClientCount")
	:SetReturnType ("number")
self:AddMethod ("GetClient")
	:AddArgument ("number", "index")		:End ()
	:SetReturnType ("Client")
self:AddMethod ("IsPublic")
	:SetReturnType ("boolean")
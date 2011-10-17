local self = GInterface.InterfaceDefinition ("string")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "string"
end
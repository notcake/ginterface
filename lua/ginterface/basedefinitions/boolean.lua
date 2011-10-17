local self = GInterface.InterfaceDefinition ("boolean")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "boolean"
end
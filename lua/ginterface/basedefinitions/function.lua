local self = GInterface.InterfaceDefinition ("function")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "function"
end
local self = GInterface.InterfaceDefinition ("nil")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return provider == nil
end
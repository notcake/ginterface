local self = GInterface.InterfaceDefinition ("anything")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return true
end
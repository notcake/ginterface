local self = GInterface.InterfaceDefinition ("number")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "number"
end
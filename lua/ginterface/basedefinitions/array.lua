local self = GInterface.InterfaceDefinition ("array")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "table"
end
local self = GInterface.InterfaceDefinition ("table")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "table"
end
local self = GInterface.InterfaceDefinition ("weapon", "entity")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "Weapon"
end
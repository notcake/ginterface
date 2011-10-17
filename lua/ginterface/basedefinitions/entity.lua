local self = GInterface.InterfaceDefinition ("entity")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "Entity" or type (provider) == "Player" or type (provider) == "Weapon"
end
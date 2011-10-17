local self = GInterface.InterfaceDefinition ("player", "entity")
GInterface.AddDefinition (self)

function self:CheckProvider (provider)
	return type (provider) == "Player"
end
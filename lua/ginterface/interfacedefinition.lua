local self = {}
GInterface.InterfaceDefinition = GInterface.MakeConstructor (self)

function self:ctor (name)
	self.Name = name
	self.Methods = {}
end

function self:AddMethod (name)
	self.Methods [name] = true
end

function self:CheckProvider (provider)
	local missing = {}
	for k, _ in pairs (self.Methods) do
		if not provider [k] then
			missing [#missing + 1] = k
		end
	end
	return missing
end

function self:GetName ()
	return self.Name
end

function self:RemoveMethod (name)
	self.Methods [name] = false
end
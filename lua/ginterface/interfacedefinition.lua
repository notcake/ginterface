local self = {}
GInterface.InterfaceDefinition = GInterface.MakeConstructor (self)

function self:ctor (name, base)
	self.Name = name
	self.Base = base
	
	self.Events = {}
	self.Methods = {}
	
	self.Singleton = nil
end

function self:AddEvent (name)
	local callback = GInterface.CallbackMethod (name, self)
	callback:AddArgument (self:GetName (), self:GetName ():lower ())	:End ()
	
	self.Events [name] = callback	
	return callback
end

function self:AddMethod (name)
	self.Methods [name] = GInterface.Method (name)
	return self.Methods [name]
end

function self:CheckProvider (provider)
	local valid, missing = true, nil
	if self.Base then
		local base = GInterface.GetDefinition (self.Base)
		if base then
			valid, missing = base:CheckProvider (provider)
		end
	end
	
	missing = missing or {}
	for k, _ in pairs (self.Methods) do
		if not provider [k] then
			missing [#missing + 1] = k
			valid = false
		end
	end
	return valid, missing
end

function self:GetName ()
	return self.Name
end

function self:GetSingletonInterface ()
	return self.Singleton
end

function self:RemoveMethod (name)
	self.Methods [name] = nil
end

function self:SetSingletonInterface (interface)
	self.Singleton = interface
end
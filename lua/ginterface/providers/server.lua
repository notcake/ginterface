local self, info = GInterface.CreateInterfaceProvider ("Server", "Server")info:SetPriority (0)function self:ctor (ip, port, hostName)	self.IP = ip	self.Port = port	self.HostName = hostName or self.IP		self.Name = "<unknown>"		self.CurrentServer = falseendfunction self:GetHostName ()	return self.HostNameendfunction self:GetName ()	return self.Nameendfunction self:GetIP ()	return self.IPendfunction self:GetPort ()	return self.Portendfunction self:IsCurrentServer ()	return self.CurrentServerend-- internalsfunction self:SetHostName (hostName)	self.HostName = hostNameendfunction self:SetName (name)	self.Name = nameendfunction self:SetCurrentServer (currentServer)	self.CurrentServer = currentServerend
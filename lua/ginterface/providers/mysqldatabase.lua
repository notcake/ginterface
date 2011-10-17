local self, info = GInterface.CreateInterfaceProvider ("Database", "MySQL1.8")info:SetPriority (1)local loaded = falsefunction self:ctor ()	self.Database = nil		if not loaded then		require ("mysql")		loaded = true	endendfunction self:Connect (server, port, username, password, name, callback)	callback = callback or function () end	if self:IsConnected () then		self:Disconnect (function ()			self:Connect (server, port, username, password, name, callback)		end)		return	end	local database, error = mysqloo.connect (server, username, password, name, port)	if database == 0 then		callback (error)		return	end	self.Database = database	callback (nil)endfunction self:Disconnect (callback)	callback = callback or function () end	if not self:IsConnected () then		return	end	local success, error mysql.disconnect (self.Database)	if not success then		callback (error)		return	end	self.Database = nil	callback ()endfunction self:EscapeString (string)	if not self:IsConnected () then		return ""	end	local string, error = mysql.escape (self.Database, string)	if not string then		return ""	end	return stringendfunction self:GetDatabaseListQuery ()	return "SHOW DATABASES"endfunction self:GetTableListQuery (database)	if database then		return "SHOW TABLES IN " .. database	else		return "SHOW TABLES"	endendfunction self:IsConnected ()	return self.Database ~= nilendfunction self:Query (query, callback)	callback = callback or function () end	if not self:IsConnected () then		callback ("Not connected to database.", nil)		return	end	local result, success, error = mysql.query (self.Database, query)	if not success then		callback (error, nil)		return	end	callback (nil, result)end
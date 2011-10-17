GInterface = GInterface or {}GInterface.Definitions = {}GInterface.Providers = {}GInterface.NamedInterfaces = {}function GInterface.AddDefinition (definition)	GInterface.Definitions [definition:GetName ()] = definitionendfunction GInterface.CreateDefinition (name)	local definition = GInterface.InterfaceDefinition (name)	GInterface.Definitions [name] = definition	return definitionendfunction GInterface.CreateInterface (interface, provider, ...)	local definition = GInterface.Definitions [interface]	if definition and not provider and definition:GetSingletonInterface () then		return definition:GetSingletonInterface ()	end	local providers = GInterface.Providers [interface]	if not providers then		return	end	if not provider then		local priority = -1		for k, info in pairs (providers) do			if info:GetPriority () >= priority then				provider = k				priority = info:GetPriority ()			end		end	end	local info = providers [provider]	if not info then		return	end	return info:CreateInterface (...)endfunction GInterface.CreateInterfaceProvider (interface, name)	local provider = GInterface.InterfaceProvider (interface, name)	local info = GInterface.InterfaceProviderInfo (interface, name, provider)	GInterface.Providers [interface] = GInterface.Providers [interface] or {}	GInterface.Providers [interface] [name] = info	return provider, infoendfunction GInterface.GetDefinition (name)	return GInterface.Definitions [name]endfunction GInterface.GetNamedInterface (name)	return GInterface.NamedInterfaces [name]endGInterface.Get = GInterface.GetNamedInterfacefunction GInterface.MakeConstructor (metatable, base)	metatable.__index = metatable		if base then		local name, basetable = debug.getupvalue (base, 1)		metatable.__base = basetable		setmetatable (metatable, basetable)	end		return function (...)		local object = {}		setmetatable (object, metatable)				-- Call base constructors		local base = object.__base		local basectors = {}		while base ~= nil do			basectors [#basectors + 1] = base.ctor			base = base.__base		end		for i = #basectors, 1, -1 do			basectors [i] (object, ...)		end				-- Call object constructor		if object.ctor then			object:ctor (...)		end		return object	endendfunction GInterface.SetNamedInterface (name, interface)	GInterface.NamedInterfaces [name] = interfaceendinclude ("ginterface/eventprovider.lua")include ("ginterface/subscriberlist.lua")include ("ginterface/interfacedefinition.lua")include ("ginterface/argument.lua")include ("ginterface/method.lua")include ("ginterface/callbackmethod.lua")include ("ginterface/interfaceprovider.lua")include ("ginterface/interfaceproviderinfo.lua")local AddCSLuaFile = SERVER and AddCSLuaFile or function () endfor _, v in ipairs (file.FindInLua ("ginterface/*.lua")) do	AddCSLuaFile ("ginterface/" .. v)endfor _, dir in ipairs ({"basedefinitions", "definitions", "providers"}) do	for _, v in ipairs (file.FindInLua ("ginterface/" .. dir .."/*.lua")) do		include ("ginterface/" .. dir .. "/" .. v)		AddCSLuaFile ("ginterface/" .. dir .. "/" .. v)	endendif SERVER then	for _, v in ipairs (file.FindInLua ("ginterface/providers/client/*.lua")) do		AddCSLuaFile ("ginterface/providers/client/" .. v)	end	for _, v in ipairs (file.FindInLua ("ginterface/providers/server/*.lua")) do		include ("ginterface/providers/server/" .. v)	endelseif CLIENT then	for _, v in ipairs (file.FindInLua ("ginterface/providers/client/*.lua")) do		include ("ginterface/providers/client/" .. v)	endend
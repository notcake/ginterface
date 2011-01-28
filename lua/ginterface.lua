if GInterface then
	return
end

if SERVER then
	AddCSLuaFile ("ginterface.lua")
	include ("ginterface/sv_init.lua")
	
	concommand.Add ("ginterface_reload_sv", function (ply, _, _)
		if ply and not ply:IsSuperAdmin () then
			return
		end
		include ("ginterface/sv_init.lua")
		for _, v in ipairs (player.GetAll ()) do
			v:ConCommand ("ginterface_reload_cl")
		end
	end)
elseif CLIENT then
	include ("ginterface/cl_init.lua")
	concommand.Add ("ginterface_reload_cl", function (ply, _, _)
		include ("ginterface/cl_init.lua")
	end)
end
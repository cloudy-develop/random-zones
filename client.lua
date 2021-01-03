local current_zone = nil
local in_zone = nil
local zone = nil
local blip = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if (current_zone == nil) then
			TriggerServerEvent("rz_server:get_zone")
		elseif (current_zone ~= nil) then
			local player = PlayerPedId()
			local player_coords = GetEntityCoords(player)
			local player_distance = GetDistanceBetweenCoords(player_coords.x, player_coords.y, player_coords.z, current_zone.x, current_zone.y, current_zone.z, false)
			
			if (player_distance < current_zone.radius) then
				in_zone = true
			else
				in_zone = false
			end
			
			if (in_zone == true) then
				-- Do anything you want to here. --
			elseif (in_zone == false) then
				-- Do anything you want to here. --
			end
		end
	end
end)

RegisterNetEvent("rz_client:draw_zone")
AddEventHandler("rz_client:draw_zone", function(source)
	current_zone = source
	RemoveBlip(zone)
	zone = AddBlipForRadius(current_zone.coords.x, current_zone.coords.y, current_zone.coords.z, current_zone.radius)
	SetBlipSprite(zone, 9)
	SetBlipAlpha(zone, 100)
	SetBlipColour(zone, current_zone.color)
end)

RegisterNetEvent("rz_client:draw_blip")
AddEventHandler("rz_client:draw_blip", function(draw_route, blip_text, blip_id)
	RemoveBlip(blip)
	blip = AddBlipForCoord(current_zone.coords.x, current_zone.coords.y, current_zone.coords.z)
	SetBlipSprite(blip, blip_id)
	if (draw_route == true) then
		SetBlipRoute(blip, true)
		SetBlipRouteColour(blip, current_zone.color)
	else
		SetBlipRoute(blip, false)
	end
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blip_text)
	EndTextCommandSetBlipName(blip)
end)
local current_zone = nil
local timer = 0

Citizen.CreateThread(function()
	Citizen.Wait(1)
	random_zone()

	while true do
		timer = config.timer
		while (timer ~= 0) do
        	Wait(1000)
			timer = timer - 1
		end
		random_zone()
		Citizen.Wait(1)
	end
end)

RegisterNetEvent("rz_server:get_zone")
AddEventHandler("rz_server:get_zone", function()
	draw_zone()
end)

function random_zone()
	local new_zone = math.random(1,#config.zones)
	current_zone = config.zones[new_zone]
	draw_zone()
end

function draw_zone()
	TriggerClientEvent("rz_client:draw_zone", -1, current_zone)
	if (config.draw_blip == true) then
		TriggerClientEvent("rz_client:draw_blip", -1, config.draw_route, config.blip_text, config.blip_id)
	end
end
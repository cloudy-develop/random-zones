config = {

	-- Blip/Color Reference: --
	-- https://docs.fivem.net/docs/game-references/blips/ --
	
	-- Config Info: --
	-- "coords" = Contains the x,y,z, coordinates for the zone. --
	-- "x" = The "X" coordinate of the zone. --
	-- "y" = The "Y" coordinate of the zone. --
	-- "z" = The "Z" coordinate of the zone. --
	-- "radius" = The radius of the zone. (Default = 300.0) --
	-- "color" = The color of the zone. (Same color id's as blips.) --

	zones = {
    {coords = {x = 1611.04, y = 3225.52, z = 40.41}, radius = 400.0, color = 1},
	{coords = {x = -1833.11, y = -1214.88, z = 13.02}, radius = 300.0, color = 1},
	{coords = {x = 73.29, y = 6536.86, z = 31.68}, radius = 100.0, color = 2}
	},
	
	timer = 30, -- How often will the zone change (In Seconds). --
	
	draw_blip = true, -- If "true" it will draw a blip in center of zone. --
	
	draw_route = false, -- "draw_blip" must be "true" for this to work. If "true" then it will draw a GPS route to the zone. --
	
	blip_text = "Zone", -- "draw_blip" must be "true" for this to work. This will change the name of the blip on the map. --
	
	blip_id = 304 -- "draw_blip" must be "true" for this to work. This will change the blip icon. --
	
}
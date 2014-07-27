minetest.register_node("death:body", {
	description = "Dead Players body",
	tiles = {"death_body.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	is_ground_content = true,
	groups = {crumbly=3,not_in_creative_inventory=1},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-1, -0.5, -0.25, 0.5, -0.25, 0.25}, 
			{0.25, -0.5, 0.25, 0.5, -0.25, 0.9375}, 
			{0.25, -0.5, -0.9375, 0.5, -0.25, -0.25}, 
			{0.5, -0.625, -0.25, 1, -0.125, 0.25}, 			
		},
	},	
	selection_box = {
		type = "fixed",
		fixed = {
			{-1, -0.5, -0.25, 0.5, -0.25, 0.25}, 
			{0.25, -0.5, 0.25, 0.5, -0.25, 0.9375}, 
			{0.25, -0.5, -0.9375, 0.5, -0.25, -0.25}, 
			{0.5, -0.625, -0.25, 1, -0.125, 0.25}, 
			},
		},
		drop = {
		items = {
			{ items = {'death:bones 6'},
			},
			{ items = {'death:meat 8'},
			},
			{ items = {'death:skin 2'},
			},
		}
	},
})










minetest.register_on_dieplayer(function(player)
	--[[if minetest.setting_getbool("creative_mode") then
		return
	end]]--
	
	local pos = player:getpos()
	pos.x = math.floor(pos.x+0.5)
	pos.y = math.floor(pos.y+0.5)
	pos.z = math.floor(pos.z+0.5)
	local param2 = minetest.dir_to_facedir(player:get_look_dir())	
	
	minetest.add_node(pos, {name="death:body", param2=param2})
	
end)
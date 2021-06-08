-- game

-- {
--   "sausage": "01- 2",
--   "plate + sausage": "010001- 34",
--   "bread + plate + sausage": "011001- 38",
--   "bread + mustard + plate + sausage": "011101- 46",
--   "bread + ketchup + plate + sausage": "011011- 54",
--   "mustard + plate + sausage": "010101- 42",
--   "ketchup + plate + sausage": "010011- 50",
--   "bread": "001- 4",
--   "bread + plate": "001001- 36",
--   "bread + mustard + plate": "001101- 44",
--   "bread + ketchup + plate": "001011- 52",
--   "mustard": "0001- 8",
--   "mustard + plate": "000101- 40",
--   "ketchup": "00001- 16",
--   "ketchup + plate": "000011- 48",
--   "plate": "000001- 32"
-- }
--
food_flags={[3]=1,[4]=1,[8]=1,[16]=1}
plate=32
full_ketchup=54
full_mustard=46
bin=7
serve=6
score=0
recipes={34,46,54,42,50,36,44,52,40,48,38}
recipe_x=87
recipe_y=0
start_timer=2
max_recipes=8
cooking_timer=6
burnt_timer=3
death_time=2

extinguisher=13
pan=9
sausage_raw=3
sausage=2
pan_cooking=12
pan_burning=10
pan_cooked=11
hole=14

last=0
started=false
start=nil
endt=nil
current_recipes={}
cooking={}


function game_init()
	local curr=levels[level]
	for this_plate in all(curr.plates) do
		mset(this_plate.x,this_plate.y,get_sprite_by_flag(plate))
	end
	for this_pan in all(curr.pans) do
		mset(this_pan.x,this_pan.y,get_sprite_by_flag(pan))
	end
	wait=2
	cooking={}
	players={}
	make_p1()
	if two_players then
		make_p2()
	end
	current_recipes={}
	started=true
	start=time()
	endt=nil
	add_recipe()
	last=time()
	score=0
	music(curr.music)
end


function game_update()
	move_player(p)
	fall(p)
	if two_players then
		move_player(p2)
		fall(p2)
	end
	move_recipes()
	end_game()
	if endt and time()-endt>2 then
		go_to_results()
	end
	cook_stuff()
end


function game_draw()
	cls()
	map(levels[level].map_x,levels[level].map_y)
	if not p.dead then
		spr(p.sprite,p.x,p.y,1,1,p.flip)
		if p.bag.spr and not endt then
			local x=p.x
			if p.flip then
				x-=7
			else
				x+=7
			end
			spr(p.bag.spr,x,p.y)
		end
	end
	if two_players then
		if not p2.dead then
			spr(p2.sprite,p2.x,p2.y,1,1,p2.flip)
			if p2.bag.spr and not endt then
				local x=p2.x
				if p2.flip then
					x-=7
				else
					x+=7
				end
				spr(p2.bag.spr,x,p2.y)
			end
		end
	end
	print(tostr(score),1,3,7)
	if endt then
		print_center("time!",8)
	end
	draw_recipes()
	draw_timer()
	draw_cooking_timer()
end


function fall(player)
	if player.dead then
		if time()-player.dead>death_time then
			if player==p then
				return make_p1()
			else
				return make_p2()
			end
		end
	else
		local map_x=flr((player.x+4)/8)+levels[level].map_x
		local map_y=flr((player.y+4)/8)+levels[level].map_y
		local tile=mget(map_x,map_y)
		if fget(tile)==hole then
			sfx(fall_sound)
			if player==p then
				p.dead=time()
			else
				p2.dead=time()
			end
		end
	end
end


function cook_stuff()
	for item in all(cooking) do
		local time_cooking=flr(time()-item.t)
		if time_cooking>cooking_timer then
			item.cooked=true
			if time_cooking>burnt_timer+cooking_timer then
				item.burnt=true
				local burning=get_sprite_by_flag(pan_burning)
				if burning then
					mset(item.x,item.y,burning)
				end
			else
				local cooked=get_sprite_by_flag(pan_cooked)
				if cooked then
					mset(item.x,item.y,cooked)
				end
			end
		end
	end
end


function draw_cooking_timer()
	local map_x=levels[level].map_x
	local map_y=levels[level].map_y
	for item in all(cooking) do
		local x=(item.x-map_x)*8
		local y=(item.y-map_y)*8
		local time_cooking=flr(time()-item.t)
		if item.cooked and not item.burnt then
			if (time()*1000)%2==0 then
				rectfill(x,y+8,x+8,y+8,8)
			end
			break
		elseif item.burnt then
			break
		else
		for i=0,time_cooking do
			pset(x+i,y+8,3)
		end
	end
	end
end


function end_game()
	if start and not endt and time()-start>levels[level].duration then
		music(-1, 300)
		endt=time()
		if score>=levels[level].star3 then
			rank=3
		elseif score>=levels[level].star2 then
			rank=2
		elseif score>=levels[level].star1 then
			rank=1
		else
			rank=0
		end
		if rank>levels[level].rank then
			levels[level].rank=rank
		end
	end
end


function draw_timer()
	local timeleft=levels[level].duration
	local color=7
	if endt then
		timeleft=0
	elseif start then
		timeleft=levels[level].duration-(time()-start)
	end
	if timeleft<5 then
		color=8
	end
	print(tostr(timeleft),112,3,color)
end


function make_p1()
	p={}
	p.x=levels[level].x
	p.y=levels[level].y
	p.dx=0
	p.dy=0
	p.w=7
	p.h=7
	p.sprite=0
	p.xspd=3
	p.yspd=3
	p.a=1
	p.drg=0.7
	p.flip=false
	p.bag={flag=nil, spr=nil}
	p.idx=0
end


function make_p2()
		p2={}
		p2.x=levels[level].x2
		p2.y=levels[level].y2
		p2.dx=0
		p2.dy=0
		p2.w=7
		p2.h=7
		p2.sprite=48
		p2.xspd=3
		p2.yspd=3
		p2.a=1
		p2.drg=0.7
		p2.flip=false
		p2.bag={flag=nil, spr=nil}
		p2.idx=1
end


function move_recipes()
	if time()-last>levels[level].recipe_time and not endt then
		last=time()
		add_recipe()
		if #current_recipes==max_recipes then
			del(current_recipes,current_recipes[1])
			score-=10
			sfx(wrong_sound)
		end
	end
end


function draw_recipes()
	for i,recipe in ipairs(current_recipes) do
		spr(recipe,recipe_x-(#current_recipes-i)*8,recipe_y)
	end
end



function move_player(player)
	if endt then
		return 0
	end
	if btn(0,player.idx) then player.dx-=player.a end
	if btn(1,player.idx) then  player.dx+=player.a end
	if btn(2,player.idx) then player.dy-=player.a end
	if btn(3,player.idx) then player.dy+=player.a end
	if btnp(4,player.idx) then grab_drop(player) end
	if btnp(5,player.idx) then do_action() end
	player.dx=mid(-player.xspd,player.dx,player.xspd)
	player.dy=mid(-player.yspd,player.dy,player.yspd)

	if player.dx>0 then player.flip=false end
	if player.dx<0 then player.flip=true end

	wall_check(player)
	if can_move(player,player.dx,player.dy) then
		player.x+=player.dx
		player.y+=player.dy
	else
		local tdx=player.dx
		local tdy=player.dy
		while (not can_move(player,tdx,tdy)) do
			if (abs(tdx)<=0.1) then
				tdx=0
			else
				tdx*=0.9
			end
			if (abs(tdy)<=0.1) then
				tdy=0
			else
				tdy*=0.9
			end
		end
		player.x+=tdx
		player.y+=tdy
	end

	if abs(player.dx)>0 then player.dx*=player.drg end
	if abs(player.dy)>0 then player.dy*=player.drg end
	if abs(player.dx)<0.02 then player.dx=0 end
	if abs(player.dy)<0.02 then player.dy=0 end
end


function get_around(mx,my)
	local x=flr(mx/8)+levels[level].map_x
	local y=flr(my/8)+levels[level].map_y
	local x_top,x_bottom,x_right,x_left=x,x,x+1,x-1
	local y_top,y_bottom,y_right,y_left=y-1,y+1,y,y
	local x_top_right,y_top_right=x+1,y-1
	local x_top_left,y_top_left=x-1,y-1
	local x_bottom_right,y_bottom_right=x+1,y+1
	local x_bottom_left,y_bottom_left=x-1,y+1
	local top=mget(x_top,y_top)
	local bottom=mget(x_bottom,y_bottom)
	local right=mget(x_right,y_right)
	local left=mget(x_left,y_left)
	local top_right=mget(x_top_right,y_top_right)
	local bottom_right=mget(x_bottom_right,y_bottom_right)
	local bottom_left=mget(x_bottom_left,y_bottom_left)
	local top_left=mget(x_top_left,y_top_left)
	return {
		{
			x=x_top,
			y=y_top,
			val=top
		},
		{
			x=x_right,
			y=y_right,
			val=right
		},
		{
			x=x_bottom,
			y=y_bottom,
			val=bottom
		},
		{
			x=x_left,
			y=y_left,
			val=left
		},
		{
			x=x_bottom_left,
			y=y_bottom_left,
			val=bottom_left
		},
		{
			x=x_bottom_right,
			y=y_bottom_right,
			val=bottom_right
		},
		{
			x=x_top_left,
			y=y_top_left,
			val=top_left
		},
		{
			x=x_top_right,
			y=y_top_right,
			val=top_right
		},
	}
end


function pick_up_plate(tile,player)
	local flag=fget(tile.val)
	local new_spr=get_sprite_by_flag(plate)
	if new_spr then
		fill_bag(tile.val,flag,player)
		mset(tile.x,tile.y,new_spr)
	end
end


function pick_up_cooked(tile,player)
	local new_spr=get_sprite_by_flag(pan)
	if new_spr then
		local item=get_sprite_by_flag(sausage)
		if item then
			fill_bag(item,sausage,player)
			mset(tile.x,tile.y,new_spr)
			remove_cooking(tile)
		end
	end
end


function grab(player)
	for tile in all(get_around(player.x,player.y)) do
		local flag=fget(tile.val)
		if flag==pan_cooked then
			pick_up_cooked(tile,player)
			sfx(pick_sound)
		elseif flag>=plate then
			pick_up_plate(tile,player)
			sfx(pick_sound)
		elseif flag==extinguisher then
			sfx(pick_sound)
			fill_bag(tile.val,flag,player)
		else
			local food=food_flags[flag]
			if food and not player.bag.spr then
				sfx(pick_sound)
				fill_bag(tile.val,flag,player)
			end
		end
	end
end


function get_sprite_by_flag(flag)
	for i=3,35,1 do
		if fget(i)==flag then
			return i
		end
	end
end


function empty_bag(player)
	player.bag.spr=nil
	player.bag.flag=nil
end


function fill_bag(s,f,player)
	player.bag.spr=s
	player.bag.flag=f
end


function drop_on_plate(tile,player)
	local flag=fget(tile.val)
	if flag>=plate
		and not (flag==full_ketchup
			or flag==full_mustard) then
		local new_spr=get_sprite_by_flag(player.bag.flag+flag)
		if new_spr then
			sfx(drop_sound)
			mset(tile.x,tile.y,new_spr)
		else
			sfx(nope_sound)
		end
		player.bag.flag=nil
		player.bag.spr=nil
	else
		sfx(nope_sound)
	end
end


function add_recipe()
	local flag=rnd(recipes)
	add(current_recipes, get_sprite_by_flag(flag))
end


function eval_served(player)
	local found=false
	local idx=0
	for i,recipe in ipairs(current_recipes) do
		if recipe==player.bag.spr then
			found=true
			idx=i
			break
		end
	end
	if found then
		sfx(right_sound)
		score+=10-(#current_recipes-idx)
		del(current_recipes,player.bag.spr)
		return 0
	end
	sfx(wrong_sound)
	score-=10
end


function serve_food(player)
	eval_served(player)
	empty_bag(player)
end


function trash(player)
	empty_bag(player)
end


function drop_on_pan(tile,player)
	local flag=fget(tile.val)
	if flag==pan then
		local new_spr=get_sprite_by_flag(player.bag.flag+flag)
		if new_spr then
			sfx(drop_sound)
			mset(tile.x,tile.y,new_spr)
			add(cooking,{x=tile.x,y=tile.y,t=time()})
		else
			sfx(nope_sound)
		end
		player.bag.flag=nil
		player.bag.spr=nil
	else
		sfx(nope_sound)
	end
end


function remove_cooking(tile)
	for k,item in ipairs(cooking) do
		if item.x==tile.x and item.y==tile.y then
			deli(cooking,k)
		end
	end
end


function extinguish(tile,player)
	local flag=fget(tile.val)
	if flag==pan_burning then
		local new_spr=get_sprite_by_flag(pan)
		if new_spr then
			sfx(drop_sound)
			mset(tile.x,tile.y,new_spr)
			remove_cooking(tile)
		else
			sfx(nope_sound)
		end
		player.bag.flag=nil
		player.bag.spr=nil
	else
		sfx(nope_sound)
	end
end



function drop(player)
	for tile in all(get_around(player.x,player.y)) do
		local flag=fget(tile.val)
		if flag>=plate then
			return drop_on_plate(tile,player)
		elseif flag==serve then
			return serve_food(player)
		elseif flag==bin then
			return trash(player)
		elseif flag==pan and player.bag.flag==sausage_raw then
			return drop_on_pan(tile,player)
		elseif flag==pan_burning and player.bag.flag==extinguisher then
			return extinguish(tile,player)
		end
	end
end


function grab_drop(player)
	if player.bag.spr then
		drop(player)
	else
		grab(player)
	end
end


function do_action()
	printh("do_action")
end

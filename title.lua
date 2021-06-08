-- home

level=1
road_x_top=61
road_y_top=97
road_x_bottom=127
road_y_bottom=99
direction=1
max_level=3
walking=0
wait=2


function title_update()
	if wait>0 then
		wait-=1
		return 0
	end
	if btn(4) then choose_players() end
	if btnp(1) then next_level() end
	if btnp(0) then previous_level() end
	move()
end


function choose_players()
	state.up=players_update
	state.dw=players_draw
end


function title_draw()
	cls()
	print_center("kitchen fire",3,30)
	print_center("press z to start the game")
	draw_road()
	spr(0,60,90)
	if walking==0 then
		draw_stars(levels[level].rank)
		print_level()
	end
end




function draw_road()
	rectfill(road_x_top,road_y_top,road_x_bottom,road_y_bottom,15)
	for i=1,max_level do
		circfill(road_x_top+64*(i-1)+2,road_y_top+1,3,4)
	end
end


function print_level()
	print_center("level "..tostr(level),6,120)
end


function move()
	if walking>0 then
		road_x_top-=1*direction
		if level==max_level and direction>0 then
			road_x_bottom-=1
		end
		if level==max_level-1 and direction<0 then
			road_x_bottom+=1
		end
		walking-=1
	end
end


function next_level()
	if level==max_level
	or walking>0
	then return 0 end
	if levels[level].rank<1 then
		sfx(nope_sound)
		return 0
	end
	walking=64
	direction=1
	level+=1
end


function previous_level()
	if level==1 or walking>0 then return 0 end
	walking=64
	direction=-1
	level-=1
end

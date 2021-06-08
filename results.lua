first_star_x=51
good_star=27
bad_star=28
star_y=108

function results_update()
	if btnp(4) then go_to_title() end
end


function results_draw()
	cls()
	draw_stars(rank)
	print_center("score: "..tostr(score),3)
	print_center("press z to go back",7,75)
	print_center("to the title screen",7,85)
end


function draw_stars(cur_rank)
	if cur_rank>0 then
		for c=1,cur_rank do
			spr(good_star,first_star_x+9*(c-1),star_y)
		end
	end
	for c=cur_rank+1,#levels do
		spr(bad_star,first_star_x+9*(c-1),star_y)
	end
end


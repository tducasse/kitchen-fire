-- players

two_players=false

function players_update()
	if btnp(3) or btnp(2) then
		two_players=not two_players
	end
	if btnp(4) then start_game() end
	if btnp(5) then go_to_title() end
end


function players_draw()
	cls()
	print_center("how many players?",7,30)
	local c1=7
	local c2=7
	if two_players then
		c1=7
		c2=8
	else
		c1=8
		c2=7
	end
	print_center("1 player",c1,50)
	print_center("2 players",c2,60)
end



function start_game()
	music(levels[level].music)
	game_init()
	state.up=game_update
	state.dw=game_draw
end

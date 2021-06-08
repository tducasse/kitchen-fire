function h_center(text)
	return 64-#text*2
end


function print_center(text,c,v)
	print(text,h_center(text),v or 60, c or 7)
end


function go_to_title()
		music(music_title)
		state.up=title_update
		state.dw=title_draw
end


function go_to_results()
		if rank>0 then
			sfx(success_sound)
		else
			sfx(failure_sound)
		end
		state.up=results_update
		state.dw=results_draw
end


function prints(...)
	local params = {...}
	local all_str=tostr(params[1])
	deli(params,1)
	for item in all(params) do
		all_str=all_str..', '..tostr(item)
	end
	printh(all_str)
end

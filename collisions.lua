-- collisions

function can_move(a,dx,dy)
	local nx_l=a.x+dx
	local nx_r=a.x+dx+a.w
	local ny_t=a.y+dy
	local ny_b=a.y+dy+a.h

	local top_left_solid=solid(nx_l,ny_t)
	local btm_left_solid=solid(nx_l,ny_b)
	local top_right_solid=solid(nx_r,ny_t)
	local btm_right_solid=solid(nx_r,ny_b)

	return not (top_left_solid or
		btm_left_solid or
		top_right_solid or
		btm_right_solid)
end


function solid(x,y)
	local map_x=flr(x/8)
	local map_y=flr(y/8)
	local map_sprite=mget(map_x,map_y)
	local flag=fget(map_sprite)
	return flag>=1 and flag~=hole
end


function wall_check(a)
	if a.dx<0 then
		local wall_top_left=solid(a.x-1,a.y)
		local wall_btm_left=solid(a.x-1,a.y+a.h)
		if wall_top_left or wall_btm_left then
			a.dx=0
		end
	elseif a.dx>0 then
		local wall_top_right=solid(a.x+a.w+1,a.y)
		local wall_btm_right=solid(a.x+a.w+1,a.y+a.h)
		if (wall_top_right or wall_btm_right) then
			a.dx=0
		end
	end

	if a.dy<0 then
		local wall_top_left=solid(a.x,a.y-1)
		local wall_top_right=solid(a.x+a.w,a.y-1)
		if wall_top_left or wall_top_right then
			a.dy=0
		end
	elseif a.dy>0 then
		local wall_btm_left=solid(a.x,a.y+a.h+1)
		local wall_btm_right=solid(a.x,a.y+a.h+1)
		if wall_btm_right or wall_btm_left then
			a.dy=0
		end
	end
end



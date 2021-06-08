pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- the kitchen is on fire!
-- by tducasse
#include main.lua
#include collisions.lua
#include game.lua
#include title.lua
#include utils.lua
#include results.lua
#include sounds.lua
#include levels.lua
#include players.lua

__gfx__
00000aa04444444466666666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
00aaaaa04444444466666666ccccc44ccccc999cccc5555cccc5555cccc77cccccc77cccccc77cccccc7744cccc7999cccc7944cccc7999cccc7999cccc7944c
0aafff004444444466666666cccc444cccc9979ccc555c5ccc555c5ccc7777cccc7787cccc77a7cccc77444ccc79979ccc79944ccc79989ccc799a9ccc79984c
0af1f1004444444466666666ccc444cccc99799ccaaaacccc8888cccc777777cc778887cc77aaa7cc774447cc799799cc799499cc798889cc79aaa9cc799889c
0affff004444444466666666cc444cccc99799ccca666cacc8666c8cc777777cc788877cc7aaa77cc744477cc997997cc994997cc998997cc99a997cc998897c
05dddd004444444466666666c444ccccc9799cccca666cccc8666ccccc7777cccc7877cccc7a77ccc44477ccc97997ccc44997ccc98897ccc9aa97ccc48897cc
0f5dddf04444444466666666c44cccccc999cccccaaaacacc8888c8cccc77cccccc77cccccc77cccc4477cccc9997cccc4497cccc9997cccc9997cccc4497ccc
011111004444444466666666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccc55555555666666666660666666666666666606660000800000000000000000000007000000060000ccccccccccccccccccc8cc8c
ccc7944cccc7744cccc7744c50000005666660666600066666666666666606668080000000000000000000000077700b00666000ccc55cccccc55cccc8c88ccc
cc799a4ccc77884ccc77aa4c5000000566666006600000666606666666660666008000007000000000000000077777bb06666600cc5855cccc5455ccccc898cc
c799aa9cc778847cc77aa47c50000005000000006660666660066666666606660898000770000000000000007b777bb066666660c555855cc555455ccc89a88c
c99aa97cc748877cc74aa77c50000005666660066660666600000000666606660898007777777777777777777bb7bb7066666660c555855cc555455cc8aaa85c
c4aa97ccc48877ccc4aa77cc50000005666660666660666660066666660000068a998007700000000000000007bbb70006666600cc5855cccc5455cccc8885cc
c4497cccc4477cccc4477ccc50000005666666666660666666066666666000668aa800007000000000000000007b700000666000ccc55cccccc55cccccc55ccc
cccccccccccccccccccccccc55555555666666666660666666666666666606660880000000000000000000000007000000060000cccccccccccccccccccccccc
ddddddddccccccc7cccccccccccccccc444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddddddddc11c1777ccc55cccccccc49c440440040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd1c888c77cc5555cccccc499c400000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444444441c888c77c555555cccc499cc440000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444cc888cc7c555555ccc499ccc444000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444cc111ccccc5555ccc499cccc440000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444cc888cccccc55cccc49ccccc400444040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444cc888ccccccccccccccccccc444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
044fff40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04f5f540000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04ffff40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44eeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f8eeef0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000003030333033300330303033303300000033303330333033300000000000000000000000000000000000000000
00000000000000000000000000000000000000003030030003003000303030003030000030000300303030000000000000000000000000000000000000000000
00000000000000000000000000000000000000003300030003003000333033003030000033000300330033000000000000000000000000000000000000000000
00000000000000000000000000000000000000003030030003003000303030003030000030000300303030000000000000000000000000000000000000000000
00000000000000000000000000000000000000003030333003000330303033303030000030003330303033300000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000777077707770077007700000777000007770077000000770777077707770777000007770707077700000077077707770777000000000000000
00000000000000707070707000700070000000007000000700707000007000070070707070070000000700707070000000700070707770700000000000000000
00000000000000777077007700777077700000070000000700707000007770070077707700070000000700777077000000700077707070770000000000000000
00000000000000700070707000007000700000700000000700707000000070070070707070070000000700707070000000707070707070700000000000000000
00000000000000700070707770770077000000777000000700770000007700070070707070070000000700707077700000777070707070777000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000aa0000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000aaaaa0000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000aafff00000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000af1f100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000affff00000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000005dddd00000000000000000000000000000000000000000000000000000000000044
0000000000000000000000000000000000000000000000000000000000000f5dddf0000000000000000000000000000000000000000000000000000000000444
0000000000000000000000000000000000000000000000000000000000004111114fffffffffffffffffffffffffffffffffffffffffffffffffffffffff4444
0000000000000000000000000000000000000000000000000000000000004444444fffffffffffffffffffffffffffffffffffffffffffffffffffffffff4444
0000000000000000000000000000000000000000000000000000000000004444444fffffffffffffffffffffffffffffffffffffffffffffffffffffffff4444
00000000000000000000000000000000000000000000000000000000000004444400000000000000000000000000000000000000000000000000000000000444
00000000000000000000000000000000000000000000000000000000000000444000000000000000000000000000000000000000000000000000000000000044
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000060000000060000000060000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000666000000666000000666000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000006666600006666600006666600000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000066666660066666660066666660000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000066666660066666660066666660000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000006666600006666600006666600000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000666000000666000000666000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000060000000060000000060000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000600066606060666060000000660000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000600060006060600060000000060000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000600066006060660060000000060000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000600060006660600060000000060000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000666066600600666066600000666000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
00000102040810203028222426342c362e322a070606060600000000000c0b0a000d09030e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000018191a1a1a1a1a1a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020702021515151502020702020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0220202020202020202020202020200200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2301010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0501010101010101240101010101012200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0601010101010101010101010101012200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0401010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010101010101010101010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020221020202020202021300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
90030000307522b752297522775224752227521f7521d7521b7521875216752167521375213752117520f7520f7520f7521175213752167521b7521f75222752277522975230752377523a7523f7523f7523f702
000c00002705024050220501d05018050130500f0500a0500705005050030500005000050070000500003000030000300003000000000000000000030000500003000030000300000000030000f0000f0000f000
900400000b5500955007550045500a500075000550005500035000750021500135000950002500015000150001500005000250002500035000650000500005000050000500005000050000500005000050000500
0004000031050240502e050230502c05022050290501d05022050130501b050070501105000050000500300002000020000200000000000000000000000000000000000000000000000000000000000000000000
000500000c050080500205000050000500300000000270001b0001a0001900000000170000f0000f000170000f0000f0000f0000f0000f0000f0000e0000e0002600000000000002800029000370003700000000
0105000024050000002f0502f0502f0302f0302f0102f0102f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000019000190001900019000
000400001205012050150500300003000030000300003000050000700007000070000a0000a0000a0000c0000f0000f0001100016000180001f000270002b0000f00013000160001b000240002e0000a0000a000
00020000100501b050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000200c0433f2050f3133f205246150c0433f2050f3130c0430f3133f2053f205246153f2050f3130c0430c0433f2053f2050f313246150c0430f3133f2050c0430f3133f2050c043246150c0433f2050c043
911000201b13522135161351b13521105251052510518105181351b1351f1351b13518135161050e105101051b13522135161351b13521105251052510518105181351b1351f1352213524135161050e10510105
011000201313527005130331500513135270051303318005131352700513033150051313527005130331800513135270051303315005131352700513033180051313527005130331500513135270051303318005
911000001b13522135161351b13521105251052510518105291351f1351b135161351f1052210524105241051b13522135161351b1351b13522135161351b1351b13522135161351b13527105271052910529105
051000200e750007001775000700157500070013750007000e75000700007000070000700007000e7500e7000e750127001775000700157501c700137500b7001075000700157001470017750197001375010751
01100020000433f405322050d003246153f4050004300003322050d0030004300003246150000300043000030004300003322050d003246153220500003000433220500003000430000324615000030004300003
011000203f405226033f4051d6033f405226033f405276033f405296033f4051b6033f405166033f405166033f4051b6033f4052b6033f405356033f405336033f4051d6033f405166033f405166033f40500603
000100000000002000020000200002000030000300009000130001b00025000210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
03 08494b44
01 0a094b44
02 0a0b4344
02 0a4b4344
03 0c0d4e44


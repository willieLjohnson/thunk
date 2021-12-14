extends Node

# https://coolors.co/78c3fb-c2f970-7f2ccb-ed4d6e-ffb86f-fffbfe-596f62-0d1321

export(Color) var PLAYER_COLOR = Color8(194, 249, 112, 255) # inchworm
export(Color) var ENEMY = Color8(237, 77, 110, 255) # paradise-pink
export(Color) var ENEMY2 = Color8(255, 184, 111, 255) # mellow-apricot
export(Color) var ENEMY3 = Color8(127, 44, 203, 255) # french-violet
export(Color) var UPGRADE = Color8(120, 195, 251, 255) # maya-blue
export(Color) var UPGRADE2 = Color8(255, 251, 254, 255) # snow
export(Color) var FOREGROUND = Color8(89, 111, 98, 127) # rich-black-fogra-29
export(Color) var DESTRUCTABLES = Color8(89, 111, 98, 255) # rich-black-fogra-29
export(Color) var BACKGROUND = Color8(13, 19, 33, 255) # rich-black-fogra-29


func _ready():
	VisualServer.set_default_clear_color(BACKGROUND)

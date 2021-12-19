extends Node2D


onready var map = $TileMap
func _ready():
	map.modulate = Styles.FOREGROUND
	Global.node_creation_parent = self

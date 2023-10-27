extends Node2D


@onready var xp_counter = $Player/Camera2D/XPCounter


func _process(_delta):
	xp_counter.text = "XP: " + str(Globals.get_player_XP())

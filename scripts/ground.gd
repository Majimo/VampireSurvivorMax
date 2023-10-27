extends Node2D


@onready var lvl_counter = $UiContainer/VBoxContainer/LvlCounter
@onready var progress_bar = $UiContainer/VBoxContainer/ProgressBar


func _process(_delta):
	lvl_counter.text = "Niveau: " + str(Globals.get_player_lvl())
	
	progress_bar.max_value = Globals.get_next_lvl_milestone()
	progress_bar.min_value = Globals.get_previous_lvl_milestone()
	progress_bar.value = Globals.get_player_XP()

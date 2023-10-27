extends Node


var has_knives = false
var has_garlic = false
var player_XP = 0


### GETTER AND SETTERS ###
# has_knives getter&setter
func set_has_knives(value: bool) -> void:
	has_knives = value
func get_has_knives() -> bool:
	return has_knives

# has_garlic getter&setter
func set_has_garlic(value: bool) -> void:
	has_garlic = value
func get_has_garlic() -> bool:
	return has_garlic

# player_XP getter&setter
func set_player_XP(value: int) -> void:
	player_XP = value
func get_player_XP() -> int:
	return player_XP

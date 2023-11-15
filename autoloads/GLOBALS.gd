extends Node


var has_knives = false
var has_garlic = false
var has_axe = false
var player_XP = 0
var level_steps = [0, 6, 20, 50]



# has_axe getter&setter
func set_has_axe(value: bool) -> void:
	has_axe = value
func get_has_axe() -> bool:
	return has_axe
	
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


### FUNCTIONS ###
func get_player_lvl() -> int:
	var lvl = 0
	if get_player_XP() == 0:
		return 1
	for i in range(level_steps.size()):
		if get_player_XP() > level_steps[i]:
			continue
		elif get_player_XP() <= level_steps[i]:
			lvl = i
			break
	return lvl

func get_next_lvl_milestone() -> int:
	return level_steps[get_player_lvl()]

func get_previous_lvl_milestone() -> int:
	return level_steps[get_player_lvl() - 1]

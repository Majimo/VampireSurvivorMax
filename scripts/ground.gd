extends Node2D


@onready var lvl_counter = $UiContainer/VBoxContainer/LvlCounter
@onready var progress_bar = $UiContainer/VBoxContainer/ProgressBar

@onready var ennemy_skeleton = preload("res://scenes/skeleton.tscn")

var has_spawned_skeleton = false


func _process(_delta):
	lvl_counter.text = "Niveau: " + str(Globals.get_player_lvl())
	
	progress_bar.max_value = Globals.get_next_lvl_milestone()
	progress_bar.min_value = Globals.get_previous_lvl_milestone()
	progress_bar.value = Globals.get_player_XP()
	
	if !has_spawned_skeleton:
		has_spawned_skeleton = true
		spawn_skeleton()

func get_spawning_time():
	var time = Globals.level_steps[Globals.level_steps.size() - 1] / Globals.get_next_lvl_milestone()
	
	return float(float(time) / 50)

func spawn_skeleton():
	var skeleton_instance = ennemy_skeleton.instantiate()
	
	var mob_spawn_location = get_node("Player/Camera2D/Path2D/SpawningLine")
	mob_spawn_location.progress_ratio = randf()

	skeleton_instance.position = mob_spawn_location.global_position
	
	var time = get_spawning_time()
	
	add_child(skeleton_instance)
	await get_tree().create_timer(time).timeout
	has_spawned_skeleton = false

extends Node2D


@onready var lvl_counter = $UiContainer/VBoxContainer/LvlCounter
@onready var progress_bar = $UiContainer/VBoxContainer/ProgressBar

@onready var ennemy_skeleton = preload("res://scenes/skeleton.tscn")

@onready var spawnpoints = [
	$Player/Camera2D/SpawnPoint1,
	$Player/Camera2D/SpawnPoint2,
	$Player/Camera2D/SpawnPoint3,
	$Player/Camera2D/SpawnPoint4
]

var has_spawned_skeleton = false


func _process(_delta):
	lvl_counter.text = "Niveau: " + str(Globals.get_player_lvl())
	
	progress_bar.max_value = Globals.get_next_lvl_milestone()
	progress_bar.min_value = Globals.get_previous_lvl_milestone()
	progress_bar.value = Globals.get_player_XP()
	
	if !has_spawned_skeleton:
		has_spawned_skeleton = true
		spawn_skeleton(spawnpoints[(randi() % 4) - 1])

func spawn_skeleton(skeleton_origin: Node2D):
	var skeleton_instance = ennemy_skeleton.instantiate()
	skeleton_instance.set_position(skeleton_origin.global_position)
	skeleton_instance.set_name("Toto")
	add_child(skeleton_instance)
	await get_tree().create_timer(3).timeout
	has_spawned_skeleton = false

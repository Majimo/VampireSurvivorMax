extends Node2D

@onready var garlic_animation = $GarlicAnimation
@onready var knives_animation = $KnivesAnimation
@onready var knives_collision = $KnivesArea/KnivesCollison
@onready var garlic_collision = $GarlicArea/GarlicCollision
@onready var axe = preload("res://scenes/axe_rigid_body.tscn")

var knives_out = true


func _ready():
	attack_with_axe()

func _process(_delta):
	if Globals.get_has_garlic():
		garlic_animation.play()
		garlic_collision.disabled = false
	if knives_out and Globals.get_has_knives():
		launch_knives()
	if knives_animation.frame == 3:
		_on_knives_animation_end()


func attack_with_axe():
	var axe_instance = axe.instantiate()
	add_child(axe_instance)
	await get_tree().create_timer(1.5).timeout
	attack_with_axe()

func launch_knives():
	knives_collision.disabled = false
	knives_out = false
	knives_animation.play()


func _on_garlic_area_body_entered(body):
	if "Skeleton" in body.get_name():
		body.queue_free()
		Globals.set_player_XP(Globals.get_player_XP() + 2)


func _on_knives_animation_end():
	knives_animation.stop()
	knives_animation.frame = 0
	knives_collision.disabled = true
	await get_tree().create_timer(1).timeout
	launch_knives()

func _on_axe_destroyed():
	print("nooo")

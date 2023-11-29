extends Node2D

@onready var garlic_animation = $GarlicAnimation
@onready var garlic_collision = $GarlicArea/GarlicCollision
@onready var knives_animation = $ForMore/KnivesAnimation
@onready var knives_collision = $ForMore/KnivesArea/KnivesCollison

var knives_out = true


func _on_knives_animation_end():
	knives_animation.stop()
	knives_animation.frame = 0
	knives_collision.disabled = true
	await get_tree().create_timer(1).timeout
	launch_knives()

func launch_knives():
	knives_collision.disabled = false
	knives_out = false
	knives_animation.play()

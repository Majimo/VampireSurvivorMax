extends Node2D

@onready var animations = $AnimatedSprite2D
@onready var knives_collision = $KnivesArea/KnivesCollison

var knives_out = true


func _process(_delta):
	if knives_out and Globals.get_has_knives():
		launch_knives()
	if animations.frame == 3 and animations.get("animation") == "knives":
		_on_knives_animation_end()
	
func launch_knives():
	knives_collision.disabled = false
	knives_out = false
	animations.play("knives")


func _on_knives_animation_end():
	animations.stop()
	animations.frame = 0
	knives_collision.disabled = true
	await get_tree().create_timer(1).timeout
	launch_knives()

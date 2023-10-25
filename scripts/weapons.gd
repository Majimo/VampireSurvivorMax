extends Node2D

var knives_out = true


func _process(delta):
	if knives_out and Globals.get_has_knives():
		launch_knives()
	if $AnimatedSprite2D.frame == 3:
		_on_knives_animation_end()
	
func launch_knives():
	knives_out = false
	$AnimatedSprite2D.play("knives")


func _on_knives_animation_end():
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.frame = 0
	await get_tree().create_timer(1).timeout
	launch_knives()

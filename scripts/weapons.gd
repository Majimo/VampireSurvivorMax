extends Node2D

@onready var garlic_animation = $GarlicAnimation
@onready var garlic_collision = $GarlicArea/GarlicCollision
@onready var knives_animation = $ForMore/KnivesAnimation
@onready var knives_collision = $ForMore/KnivesArea/KnivesCollison

var knives_out = true


func _process(_delta):
	if Globals.get_has_garlic():
		garlic_animation.play()
		garlic_collision.disabled = false
#	if knives_out and Globals.get_has_knives():
#		launch_knives()
#	if knives_animation.frame == 3:
#		_on_knives_animation_end()


func _on_garlic_area_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
		Globals.set_player_XP(Globals.get_player_XP() + 2)

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

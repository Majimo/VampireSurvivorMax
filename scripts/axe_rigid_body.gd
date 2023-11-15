extends Node2D


@onready var axe_animation = $AxeSprite/AxeAnimation

var initial_velocity = Vector2(200, -600)
var gravity = Vector2(0, 800)
var time = 0
var max_time = 2


func _ready():
	print($AxeArea)
	axe_animation.play("throw")

func _process(delta: float) -> void:
	time += delta
	if time <= max_time:
		var velocity = initial_velocity + gravity * time
		position += velocity * delta
	else:
		queue_free()


func _on_axe_area_body_entered(body):
	print("axe entered", body)
	if "Skeleton" in body.get_name():
		body.queue_free()
		Globals.set_player_XP(Globals.get_player_XP() + 2)

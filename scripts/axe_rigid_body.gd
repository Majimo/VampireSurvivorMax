extends Node2D


@onready var axe_animation = $AxeSprite/AxeAnimation
@onready var axe_area = $Area2D


var initial_velocity = Vector2(200, -600)
var gravity = Vector2(0, 800)
var time = 0
var max_time = 2


func _ready():
	axe_animation.play("throw")
	axe_area.body_entered.connect(toto_lala)

func _process(delta: float) -> void:
	time += delta
	if time <= max_time:
		var velocity = initial_velocity + gravity * time
		position += velocity * delta
	else:
		queue_free()


func toto_lala(body):
	if "Skeleton" in body.get_name():
		body.queue_free()
		Globals.set_player_XP(Globals.get_player_XP() + 2)

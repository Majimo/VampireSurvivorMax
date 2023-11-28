extends Node2D


@onready var axe_animation = $AxeSprite/AxeAnimation
@onready var axe_area = $Area2D


@export var initial_velocity = Vector2(200, -600)
@export var gravity = Vector2(0, 800)
@export var time = 0
@export var max_time = 2


func _ready():
	axe_animation.play("throw")
	axe_area.body_entered.connect(kill_enemy_with_axe)

func _process(delta: float) -> void:
	time += delta
	if time <= max_time:
		var velocity = initial_velocity + gravity * time
		position += velocity * delta
	else:
		queue_free()


func kill_enemy_with_axe(body):
	if body.is_in_group("enemy"):
		body.queue_free()
		Globals.set_player_XP(Globals.get_player_XP() + 2)

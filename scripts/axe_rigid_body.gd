extends RigidBody2D


@onready var axe_animation = $AxeSprite/AxeAnimation

var initial_velocity = Vector2(200, -600)
var gravity = Vector2(0, 800)
var time = 0
var max_time = 2


func _ready():
	Globals.Axe = self
	axe_animation.play("throw")

func _process(delta: float) -> void:
	time += delta
	if time <= max_time:
		var velocity = initial_velocity + gravity * time
		position += velocity * delta
	else:
		queue_free()

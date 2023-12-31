extends CharacterBody2D


@onready var timer = $HitTimer
@onready var animation = $AnimationPlayer

@export var speed = 200

var can_be_hit = true


func _process(delta):
	# Déplacement horizontal
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var horizontal_movement = Vector2(horizontal_input, 0).normalized() * speed * delta

	# Déplacement vertical
	var vertical_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var vertical_movement = Vector2(0, vertical_input).normalized() * speed * delta

	# Calcul du déplacement total
	var movement = horizontal_movement + vertical_movement
	
	if horizontal_input == 1:
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x)
#		$Weapons.scale.x = abs($Weapons.scale.x)
	elif horizontal_input == -1:
		$AnimatedSprite2D.scale.x = -abs($AnimatedSprite2D.scale.x)
#		$Weapons.scale.x = -abs($Weapons.scale.x)

	if movement:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

	var enemy_colision = move_and_collide(movement)
	
	if enemy_colision and can_be_hit:
		timer.start(1.0)
		remove_life()


func remove_life():
	animation.play("hit")
	can_be_hit = false
	var lifeAmount = $LifeAmount.get_point_position(1).x
	if lifeAmount > -20:
		$LifeAmount.set_point_position(1, Vector2(lifeAmount - 4, -28))
	else: get_tree().quit()


func _on_hit_timer_timeout():
	can_be_hit = true

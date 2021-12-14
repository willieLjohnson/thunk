extends KinematicBody2D

export var speed = 100
export var bullet_speed = 1000
export var fire_rate = 0.1


export var ACCELERATION = 1890
export var MAX_SPEED = 500
export var FRICTION = 670

var velocity = Vector2.ZERO

var bullet = preload("res://Player/Bullet.tscn")
var can_fire = true

func _ready():
	modulate = Styles.PLAYER_COLOR
	Global.player = self

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.modulate = Styles.PLAYER_COLOR
		bullet_instance.position = $Weapon/BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true

func _physics_process(delta: float) -> void:
#	if is_dead: return
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	

	if Global.is_mobile:
		print("mobile")
##		input_vector = move_joystick.get_value()		
#
#		if shoot_joystick.event_is_pressed and Global.node_creation_parent != null and can_shoot:
#			shoot_dir.set_cast_to(shoot_joystick.get_value())
#
#			if damage >= 3:
#				Global.vibrate(2)
#			elif damage >= 2:
#				Global.vibrate(1)
#			else:
#				Global.vibrate()
#
#			var ray_endpoint = shoot_dir.global_position + shoot_dir.cast_to
#			var recoil = current_weapon.shoot(damage, ray_endpoint, modulate)
#			velocity += recoil * global_position.direction_to(ray_endpoint).normalized()
#			can_shoot = false
#			Global.camera.screen_shake(5, 0.01)
#			$ReloadSpeed.start()
#			current_weapon.look_at(ray_endpoint)
	else:
#		if Input.is_action_pressed("shoot") and Global.node_creation_parent != null and can_shoot:
#			var direction = get_global_mouse_position() 
#			var recoil = current_weapon.shoot(damage, direction, modulate)
#			velocity += recoil * global_position.direction_to(direction).normalized()
#			can_shoot = false
#			Global.camera.screen_shake(5, 0.01)
#			$ReloadSpeed.start()
#
#		$Weapons.look_at(get_global_mouse_position())
#
		if Input.is_action_just_pressed("ui_cancel"):
			get_tree().notification(MainLoop.NOTIFICATION_APP_PAUSED)
			
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		rotation /= 2

	move()
	squash_stretch(delta)
#	var new_modulate = Color.from_hsv(base_modulate.h + (damage * 0.2), base_modulate.s + (damage * 0.2), base_modulate.v - (damage * 0.05), base_modulate.a)
#	modulate = lerp(modulate, new_modulate, 0.3)
	
func move() -> void:
	velocity = move_and_slide(velocity)
#
#	Global.update_depth()
	
func squash_stretch(delta) -> void:
	var scale_vel = Vector2(abs(velocity.x), abs(velocity.y))
	var squash = ((scale_vel.y + scale_vel.x) * 0.0002)
##	var new_scale = Vector2(squash + default_shape_scale.x, (squash / -1.5) + default_shape_scale.x)
#	$Circle.rotation = velocity.angle()
#	$Circle.scale = $Circle.scale.move_toward(new_scale, ACCELERATION * delta)


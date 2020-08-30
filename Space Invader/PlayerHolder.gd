extends KinematicBody2D

export var speed = 100

export var shootrate = 1.0

export var canfire = true

var bullet = preload("res://Bullet.tscn")

func _ready():
	set_physics_process(true)
	set_process(true)
	
func _process(delta):
	if Input.is_action_just_pressed("Fire") and canfire:
		
		canfire = false
		
		var bulletinstance = bullet.instance() 
		bulletinstance.position = Vector2(position.x, position.y - 40)
		get_tree().get_root().add_child(bulletinstance)
		
		yield(get_tree().create_timer(shootrate),"timeout")
		
		canfire = true
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
		
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))



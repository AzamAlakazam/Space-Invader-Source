extends KinematicBody2D



var speed = 500

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	var collidedobj = move_and_collide(Vector2(0, -speed * delta))
	if (collidedobj):
		
		collidedobj.get_collider().queue_free()
		queue_free()
		

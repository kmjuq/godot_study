extends RigidBody2D

export var min_speed = 200
export var max_speed = 400

func _ready():
	var move_types:PoolStringArray = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = move_types[randi()%move_types.size()]
	$AnimatedSprite.play()
	add_to_group("start_game")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass
	
func start_game():
	queue_free()

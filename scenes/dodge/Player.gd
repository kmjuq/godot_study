extends Area2D

export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	pass

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
		upAnimate()
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
		downAnimate()
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
		leftAnimate()
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		rightAnimate()
		
	if velocity.length() > 0 :
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x,0,screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)
	pass


# 左右翻转为水平翻转，即 flip_h
# 上下翻转为垂直翻转，即 flip_v
func upAnimate():
	$AnimatedSprite.animation='up'
	$AnimatedSprite.flip_v=false
	
func downAnimate():
	$AnimatedSprite.animation='up'
	$AnimatedSprite.flip_v=true
	
func leftAnimate():
	$AnimatedSprite.animation='walk'
	$AnimatedSprite.flip_h=true
	
func rightAnimate():
	$AnimatedSprite.animation='walk'
	$AnimatedSprite.flip_h=false

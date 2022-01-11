extends Node

onready var Mob:PackedScene = preload("res://scenes/dodge/Mob.tscn")
onready var wait_time = $MobTimer.wait_time

func _ready():
	add_to_group("end_game")
	add_to_group("start_game")
	pass

func start_game():
	get_tree().paused=false
	$MobTimer.wait_time = wait_time
	$MobTimer.start()
	$Player.position = $StartPosition.position
	pass
	
func end_game():
	get_tree().paused=true
	$MobTimer.stop()
	pass

func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.offset = randi()
	var mob:Node = Mob.instance()
	
	mob.position = $MobPath/MobSpawnLocation.position
	
	mob.rotation = ($MobPath/MobSpawnLocation.rotation + PI / 2) + rand_range(-PI / 4, PI / 4)
	
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(mob.rotation)
	
	add_child(mob)
	
	$MobTimer.wait_time = $MobTimer.wait_time - 0.001
	pass


# warning-ignore:unused_argument
func _on_Player_body_entered(body):
	get_tree().call_group("end_game","end_game")
	pass

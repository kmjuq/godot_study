extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scene1:Resource = load("res://scenes/say_hello/say_hello.tscn")
var scene2:Resource = preload("res://scenes/say_hello/say_hello.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var node1:Control = scene1.instance()
	var node2:Control = scene2.instance()
	add_child(node1)
	add_child(node2)
	var node3:ScriptClass = ScriptClass.new()
	node3.class_instance_test()
	add_child(node3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

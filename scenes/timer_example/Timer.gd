extends Timer

signal custom_signal

func _ready():
#	这里是信号连接的代码实现方式
#	var node:Sprite = get_node("../Sprite")
#	connect("custom_signal",node,"_on_Timer_custom_signal")
	pass


func _on_Timer_timeout():
	var node:Sprite = get_node("../Sprite")
	node.visible = !node.visible
	emit_signal("custom_signal",3,"1",[1, 2, 3],{"key": "value", 2: 3})
	pass

extends Label

func _ready():
#	讲该节点添加到组
	add_to_group("sayHello")
	pass

func call_group_sayHello():
	print("_on_Button_pressed_group Label")
	pass

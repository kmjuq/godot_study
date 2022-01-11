extends Button

func _ready():
#	讲该节点添加到组
	add_to_group("sayHello")
	pass

# 只需要关注 get_node 方法
func _on_Button_pressed():
#	查找节点，相对路径方式和绝对路径方式
	get_node("/root/Control/Panel/Label").text="HELLO!"
	get_parent().get_node("Label").text="HELLO!"
	
#	通知同一组的节点出发指定函数
	get_tree().call_group("sayHello","call_group_sayHello")
	
#	释放节点
	get_node("/root/Control/Panel/Sprite_01").queue_free()
	pass
	
func call_group_sayHello():
	print("_on_Button_pressed_group Button")
	pass

extends Sprite

#godot的自定义信号就是在信号发送方设置一个信号发射器，然后在接收方写处理逻辑
#该例子中，我们的信号发送方是 Timer 节点，信号接收方 Sprite 节点。
#因此当我们需要设置自定义信号时，
#	1.需要将自定义信号设置在 Timer 节点，
#	2.自定义信号的处理逻辑 写在 Sprite 的方法上。

func _ready():
	pass

func _on_Timer_custom_signal(num,str1,arr,dict):
	print("custom signal",num,str1,arr,dict)
	pass

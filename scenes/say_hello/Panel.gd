extends Panel

func _ready():
#	创建节点，修改节点名称，加入到子节点中
	var s:Sprite = Sprite.new()
	s.name='Sprite_01'
	add_child(s)
	pass

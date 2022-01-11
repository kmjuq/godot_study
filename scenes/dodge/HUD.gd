extends CanvasLayer

var score:int = 0 # 统计分数
var game_status = 0 # 用于判断是否可以通过 space 键开始游戏
	
func _input(event):
	if event.is_action_pressed("start_game") && game_status == 0:
		get_tree().call_group("start_game","start_game")
	pass	

func _ready():
	$".".pause_mode=Node.PAUSE_MODE_PROCESS
	add_to_group("end_game")
	add_to_group("start_game")
	
func end_game():
	$ScoreTimer.stop()
	$Message.text = "Game Over"
	$Message.show()

	yield(get_tree().create_timer(1), "timeout")
	$Message.text = "Dodge the Creeps!"
	$Message.show()

	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	game_status=0
	pass

func start_game():
	game_status=1
	$Message.hide()
	$StartButton.hide()
	$ScoreTimer.start()
	score_label_text(0)
	pass

func _on_StartButton_pressed():
	get_tree().call_group("start_game","start_game")
	pass

func _on_ScoreTimer_timeout():
	score = score + 1
	score_label_text(score)
	pass
	
func score_label_text(num:int):
	score = num
	$ScoreLabel.text = String(score)

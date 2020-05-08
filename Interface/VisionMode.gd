extends CanvasModulate

const DARK = Color("111111")
const NIGHTVISION = Color("37bf62")

var cooldown = false

func _ready():
	visible = true
	NIGHTVISION_mode()

func cycle_vision_mode():
	if not cooldown:
		if color == NIGHTVISION:
			DARK_mode()
		else:
			NIGHTVISION_mode()
		cooldown = true
		$Timer.start()

func DARK_mode():
	color = DARK
	$AudioStreamPlayer2D.stream = load("res://assets/SFX/nightvision_off.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("labels", "hide")
	get_tree().call_group("lights", "show")

func NIGHTVISION_mode():
	color = NIGHTVISION
	$AudioStreamPlayer2D.stream = load("res://assets/SFX/nightvision.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("labels", "show")
	get_tree().call_group("lights", "hide")

func _on_Timer_timeout():
	cooldown = false

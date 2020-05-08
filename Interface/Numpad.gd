extends Popup

var combination = []
var guess = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light = $VBoxContainer/ButtonContainer/GridContainer/StatusLight

signal combination_correct

func _ready():
	connect_buttons()
	reset_lock()

func connect_buttons():
	for child in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "Button_pressed", [child.text])

func Button_pressed(button):
	if button == "OK":
		check_guess_and_update_display()
	else:
		enter(int(button))

func check_guess_and_update_display():
	if guess == combination:
		light.texture = load("res://assets/GFX/Interface/PNG/dotGreen.png")
		$AudioStreamPlayer.stream = load("res://assets/SFX/threeTone1.ogg")
		$AudioStreamPlayer.play()
		display.text = "SUCCESS"
		$Timer.start()
	else:
		update_display_wrong_combination()

func enter(button):
	$AudioStreamPlayer.stream = load("res://assets/SFX/twoTone1.ogg")
	$AudioStreamPlayer.play()
	guess.append(button)
	if guess.size() == combination.size():
		check_guess_and_update_display()
	else:
		update_display()

func update_display():
	display.text = PoolStringArray(guess).join("")

func update_display_wrong_combination():
	display.text = "WRONG"
	light.texture = load("res://assets/GFX/Interface/PNG/dotRed.png")
	$AudioStreamPlayer.stream = load("res://assets/SFX/oneTone1.ogg")
	guess.clear()
	
func reset_lock():
	light.texture = load("res://assets/GFX/Interface/PNG/dotYellow.png")
	guess.clear()
	update_display()

func _on_Timer_timeout():
	emit_signal("combination_correct")
	reset_lock()

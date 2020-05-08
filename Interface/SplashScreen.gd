extends CanvasLayer

func _ready():
	AudioServer.set_bus_volume_db(0, -20)

func _on_TutorialButton_pressed():
	get_tree().change_scene("res://Levels/Tutorial.tscn")

func _on_Level1Button_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()

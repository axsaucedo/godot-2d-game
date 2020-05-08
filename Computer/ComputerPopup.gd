extends Popup

func set_text(combination):
	$NinePatchRect/CenterContainer/NinePatchRect/Label.text = (
		"Code is: "
		+ PoolStringArray(combination).join("")
	)

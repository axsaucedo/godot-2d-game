extends NinePatchRect

const BRIEFCASE_SPRITE = "res://assets/GFX/Loot/suitcase.png"

func _ready():
	visible = false

func collect_loot():
	visible = true
	$VBoxContainer/LootList.add_icon_item(load(BRIEFCASE_SPRITE), false)

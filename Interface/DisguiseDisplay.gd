extends ItemList

const BOX_SPRITE = "res://assets/GFX/PNG/Tiles/tile_130.png"

func update_disguises(number):
	clear()
	for disguises in range(number):
		add_icon_item(load(BOX_SPRITE), false)

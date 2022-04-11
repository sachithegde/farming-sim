extends Node2D


export var item_id = -2


func _ready():
	pass

func item_setup():
	$Sprite.frame = item_id

func set_item_id(id):
	item_id = id


func _on_Area2D_body_entered(_body):
	var space_exists = PlayerStats.add_item(item_id, 1)
	if space_exists:
		queue_free()

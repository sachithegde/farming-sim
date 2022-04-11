extends CanvasLayer


onready var Body = $TextureRect/Panel/Frame/LeftBG/HBoxContainer/PlayerFrame/TextureRect/Control/body
onready var Top = $TextureRect/Panel/Frame/LeftBG/HBoxContainer/PlayerFrame/TextureRect/Control/top_clothes
onready var Bottom = $TextureRect/Panel/Frame/LeftBG/HBoxContainer/PlayerFrame/TextureRect/Control/bottom_clothes
onready var Shoes = $TextureRect/Panel/Frame/LeftBG/HBoxContainer/PlayerFrame/TextureRect/Control/shoes
onready var Hair = $TextureRect/Panel/Frame/LeftBG/HBoxContainer/PlayerFrame/TextureRect/Control/hair
onready var BodySlider = $TextureRect/Panel/Frame/RightBG/HBoxContainer/VBoxContainer/BodySlider
onready var HairSlider = $TextureRect/Panel/Frame/RightBG/HBoxContainer/VBoxContainer/HairSlider
onready var TopSlider = $TextureRect/Panel/Frame/RightBG/HBoxContainer/VBoxContainer2/TopSlider
onready var BottomSlider = $TextureRect/Panel/Frame/RightBG/HBoxContainer/VBoxContainer2/BottomSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	BodySlider.value = PlayerStats.body_choice
	HairSlider.value = PlayerStats.hair_choice
	TopSlider.value = PlayerStats.top_choice
	BottomSlider.value = PlayerStats.bottom_choice


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_body(value):
	PlayerStats.body_choice = value
	Body.texture = load(Textures.bodies["walk"]["skin_" + str(PlayerStats.body_choice)])
	
func change_top(value):
	PlayerStats.top_choice = value
	Top.texture = load(Textures.top["walk"]["top_" + str(PlayerStats.top_choice)])
	
func change_bottom(value):
	PlayerStats.bottom_choice = value
	Bottom.texture = load(Textures.bottom["walk"]["bottom_" + str(PlayerStats.bottom_choice)])
	
func change_shoe(value):
	PlayerStats.shoe_choice = value
	Shoes.texture = load(Textures.shoes["walk"]["shoes_" + str(PlayerStats.shoe_choice)])
	
func change_hair(value):
	PlayerStats.hair_choice = value
	Hair.texture = load(Textures.hair["walk"]["hair_" + str(PlayerStats.hair_choice)])






func _on_BodySlider_value_changed(value):
	change_body(value)


func _on_HairSlider_value_changed(value):
	change_hair(value)

func _on_TopSlider_value_changed(value):
	change_top(value)


func _on_BottomSlider_value_changed(value):
	change_bottom(value)


func _on_TextureButton_pressed():
	PlayerStats.load_textures()
	get_tree().change_scene(PlayerStats.last_scene)

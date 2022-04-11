extends Node


const Item_Scene = preload("res://Items/Item.tscn")

#bodies
var last_scene = "res://World/World.tscn"



#persistent aesthetics
var body_texture = "res://Assets/Bodies/Walk/char1_walk.png"
var top_texture = "res://Assets/Top_Clothes/Walk/Top_1.png"
var shoe_texture = "res://Assets/Shoes/Walk/Shoes_1.png"
var bottom_texture = "res://Assets/Bottom_Clothes/Walk/Bottom_1.png"
var hair_texture = "res://Assets/Hair/Walk/Hair_1.png"
var tool_texture = "res://Assets/Tools/Hoe/hoe.png"
var body_choice = 1
var top_choice = 1
var shoe_choice = 1
var bottom_choice = 1
var hair_choice = 1


#persistent core vars
var inventory = [
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0},
	{ "Item": -1, "Quantity": 0}
]

var day = 1
var month = 1

var farming_info = []


#persistent World vars
var Hay = false
var Water = false





#euipped 
var isEuipped = false
var hoeEquipped = false
var axeEquipped = false
var pickaxeEquipped = false

#carry
var isCarrying = false
var currentInv


var enterToggle = false

#environment variables
var season = 0
var worldlastPos = Vector2.ZERO
var HouselastPos = Vector2(48, 133)
var CoopLastPos = Vector2(0, -7)
var MarketLastPos = Vector2(0, -10)

var anim_state = "walk"

func _ready():
	load_textures()
	set_farming_data()

func load_textures():
	body_texture = Textures.bodies[anim_state]["skin_" + str(body_choice)]
	top_texture = Textures.top[anim_state]["top_" + str(top_choice)]
	shoe_texture = Textures.shoes[anim_state]["shoes_" + str(shoe_choice)]
	bottom_texture = Textures.bottom[anim_state]["bottom_" + str(bottom_choice)]
	hair_texture = Textures.hair[anim_state]["hair_" + str(hair_choice)]
	if anim_state == "hoe" || anim_state == "axe" || anim_state == "pickaxe":
		tool_texture = Textures.tools[anim_state]["tool_1"]
	get_tree().call_group("Player", "change_texture")
	
	
	

func _process(_delta):
	if Input.is_action_just_pressed("testing"):
#		get_tree().call_group("Player", "toggle_carry")
#		get_tree().call_group("World", "updateFarming")
#		get_tree().call_group("World", "toggle_weather")
		get_tree().call_group("World", "spawn_item", randi()%12, Vector2.ZERO)
		

#Inventory Functions
func add_item(item, qty):
	var slot_to_place = item_in_inv(item)
	if(slot_to_place == -1):
		var empty_slot = check_available_slot()
		if (empty_slot != -1):
			inventory[empty_slot]["Item"] = item
			inventory[empty_slot]["Quantity"] = qty
			get_tree().call_group("HUD", "set_Inventory_HUD")
			return true
		else:
			return false
	else:
		inventory[slot_to_place]["Quantity"] += qty
		get_tree().call_group("HUD", "set_Inventory_HUD")
		return true
	

func del_item(item, qty):
	var slot_to_place = item_in_inv(item)
	if (slot_to_place == -1):
		print("No such item in Inventory")
		return false
	else:
		if(qty > inventory[slot_to_place]["Quantity"]):
			print("Reduce Qty")
			return false
		else:
			inventory[slot_to_place]["Quantity"] -= qty
			if inventory[slot_to_place]["Quantity"] == 0:
				inventory[slot_to_place]["Item"] = -1
				if isCarrying:
					isCarrying = false
					get_tree().call_group("Player", "toggle_carry")
			get_tree().call_group("HUD", "set_Inventory_HUD")
			return true

func item_in_inv(item):
	var i = 0
	for slot in inventory:
		if slot["Item"] == item:
			return i
		i += 1
	return -1

func check_available_slot():
	var i = 0
	for slot in inventory:
		if slot["Item"] == -1:
			return i;
		i += 1
	return -1	


func set_farming_data():
	for i in range(105):
		farming_info.insert(i, -1) 
		
		
func set_farming_tile(pos,tile_id):
	farming_info[pos] = tile_id

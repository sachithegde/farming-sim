extends CanvasLayer


var selectedTexture = "res://Assets/UI/HUD/Selected.png"
var notSelectedTexture = "res://Assets/UI/HUD/NotSelected.png"

onready var AxeButton = $Tools/AxeButton
onready var PickaxeButton = $Tools/PickAxeButton
onready var HoeButton = $Tools/HoeBUtton


onready var InventoryHUD = $Inventory


# Called when the node enters the scene tree for the first time.
func _ready():
	set_Inventory_HUD()


func set_Inventory_HUD():
	var invSlots = InventoryHUD.get_children()
	var i = 0
	for child in invSlots:
		if PlayerStats.currentInv == i:
			child.texture = load(selectedTexture)
		else:
			child.texture = load(notSelectedTexture)
		if PlayerStats.inventory[i]["Item"] == -1:
			child.find_node("Label").text = ""
			child.find_node("Sprite").frame = 12
		else:
			child.find_node("Label").text = str(PlayerStats.inventory[i]["Quantity"])
			child.find_node("Sprite").frame = PlayerStats.inventory[i]["Item"]
		i += 1

func _on_AxeButton_button_down():
	PlayerStats.isEuipped = true
	PlayerStats.axeEquipped = true
	PlayerStats.pickaxeEquipped = false
	PlayerStats.hoeEquipped = false
	PlayerStats.isCarrying = false
	PlayerStats.currentInv = -1
	AxeButton.get_child(0).visible = true
	PickaxeButton.get_child(0).visible = false
	HoeButton.get_child(0).visible = false
	get_tree().call_group("Player", "toggle_carry")
	set_Inventory_HUD()
	
	
func _on_PickAxeButton_button_down():
	PlayerStats.isEuipped = true
	PlayerStats.axeEquipped = false
	PlayerStats.pickaxeEquipped = true
	PlayerStats.hoeEquipped = false
	PlayerStats.isCarrying = false
	PlayerStats.currentInv = -1
	AxeButton.get_child(0).visible = false
	PickaxeButton.get_child(0).visible = true
	HoeButton.get_child(0).visible = false
	get_tree().call_group("Player", "toggle_carry")
	set_Inventory_HUD()
	
func _on_HoeBUtton_button_down():
	PlayerStats.isEuipped = true
	PlayerStats.axeEquipped = false
	PlayerStats.pickaxeEquipped = false
	PlayerStats.hoeEquipped = true
	PlayerStats.isCarrying = false
	PlayerStats.currentInv = -1
	AxeButton.get_child(0).visible = false
	PickaxeButton.get_child(0).visible = false
	HoeButton.get_child(0).visible = true
	get_tree().call_group("Player", "toggle_carry")
	set_Inventory_HUD()

func InvSelected(index):
	PlayerStats.isEuipped = false
	PlayerStats.axeEquipped = false
	PlayerStats.pickaxeEquipped = false
	PlayerStats.hoeEquipped = false
	AxeButton.get_child(0).visible = false
	PickaxeButton.get_child(0).visible = false
	HoeButton.get_child(0).visible = false
	PlayerStats.currentInv = index
	if PlayerStats.inventory[index]["Item"] <= 3 and PlayerStats.inventory[index]["Item"] >= 0:
		PlayerStats.isCarrying = true
		get_tree().call_group("Player", "toggle_carry")
	else:
		PlayerStats.isCarrying = false
		get_tree().call_group("Player", "toggle_carry")
	get_tree().call_group("World", "highlightTile")
	set_Inventory_HUD()
	





func _on_Inv0_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(0)


func _on_Inv1_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(1)


func _on_Inv2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(2)


func _on_Inv3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(3)


func _on_Inv4_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(4)


func _on_Inv5_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(5)


func _on_Inv6_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(6)



func _on_Inv7_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(7)


func _on_Inv8_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			InvSelected(8)

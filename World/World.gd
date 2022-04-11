extends Node2D



#entry variables
var playerHouseEnter = false
var coopEnter = false
var marketEnter = false



var tilesets = ["res://World/Summer.tres", "res://World/Winter.tres"]
var farmingTilesets = ["res://World/Farming_Summer.tres","res://World/Farming_Winter.tres" ]
var playerHouseSprites = ["res://Assets/Environment/PlayerHouse/PlayerHouse_Summer.png", "res://Assets/Environment/PlayerHouse/PlayerHouse_Winter.png"]
var coopSprites = ["res://Assets/Environment/Coop/Coop_Summer.png","res://Assets/Environment/Coop/Coop_Winter.png" ]
var marketSprites = ["res://Assets/Environment/Market/Market_Summer.png","res://Assets/Environment/Market/Market_Winter.png" ]
#onready vars
onready var Player = $YSort/Player
onready var EnvTilemap = $EnvTilemap
onready var FarmingTilemap = $YSort/Farming
onready var Highlighter = $Highlighter
onready var AnimPlayer = $AnimationPlayer
onready var PlayerHouseSprite = $YSort/PlayerHome/House
onready var CoopSprite = $YSort/Coop/CoopSprite
onready var MarketSprite = $YSort/Market/MarketSprite
onready var ItemLayer = $YSort/Item_in_World

# Called when the node enters the scene tree for the first time.
func _ready():
	EnvTilemap.tile_set = load(tilesets[PlayerStats.season])
	FarmingTilemap.tile_set = load(farmingTilesets[PlayerStats.season])
	PlayerHouseSprite.texture = load(playerHouseSprites[PlayerStats.season])
	MarketSprite.texture = load(marketSprites[PlayerStats.season])
	Player.position = PlayerStats.worldlastPos
	updateFarming()
	if GameController.WorldtoBeUpdated:
		GameController.WorldtoBeUpdated = false
		
		nextDay()
	
	
	Player.Start_Timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	highlightTile()
	action_pressed()


#Testing
func toggle_weather():
	if PlayerStats.season == 0:
		PlayerStats.season = 1
	else:
		PlayerStats.season = 0
	EnvTilemap.tile_set = load(tilesets[PlayerStats.season])
	FarmingTilemap.tile_set = load(farmingTilesets[PlayerStats.season])
	PlayerHouseSprite.texture = load(playerHouseSprites[PlayerStats.season])
	CoopSprite.texture = load(coopSprites[PlayerStats.season])
	MarketSprite.texture = load(marketSprites[PlayerStats.season])
	
	




#signals responses

func _on_EnterTrigger_body_entered(_body):
	AnimPlayer.play("PlayerDoorOpen")
	playerHouseEnter = true
	PlayerStats.enterToggle = true


func _on_EnterTrigger_body_exited(_body):
	AnimPlayer.play("PlayerDoorClose")
	playerHouseEnter = false
	PlayerStats.enterToggle = false
	
func _on_EnterCoopTrigger_body_entered(_body):
	AnimPlayer.play("CoopDoorOpen")
	coopEnter = true
	PlayerStats.enterToggle = true
	

func _on_EnterCoopTrigger_body_exited(_body):
	AnimPlayer.play("CoopDoorClose")
	coopEnter = false
	PlayerStats.enterToggle = false

func _on_EnterMarketTrigger_body_entered(_body):
	AnimPlayer.play("MarketOpen")
	marketEnter = true
	PlayerStats.enterToggle = false

func _on_EnterMarketTrigger_body_exited(_body):
	AnimPlayer.play("MarketClose")
	marketEnter = false
	PlayerStats.enterToggle = false

#actions
func action_pressed():
	if Input.is_action_just_pressed("action_button") and playerHouseEnter:
		PlayerStats.worldlastPos = Player.position
		playerHouseEnter = false
		Player.set_Rem_Time()
		get_tree().change_scene("res://World/PlayerHouse.tscn")
		
	if Input.is_action_just_pressed("action_button") and coopEnter:
		PlayerStats.worldlastPos = Player.position
		coopEnter = false
		Player.set_Rem_Time()
		get_tree().change_scene("res://World/Coop.tscn")
	if Input.is_action_just_pressed("action_button") and marketEnter:
		PlayerStats.worldlastPos = Player.position
		marketEnter = false
		Player.set_Rem_Time()
		get_tree().change_scene("res://World/Market.tscn")	
	if Input.is_action_just_pressed("action_button") and PlayerStats.isCarrying:
		var temp = FarmingTilemap.world_to_map(Player.ActionTile.get_global_position())
		if FarmingTilemap.get_cellv(temp) == 0:
			plant_seed(temp)
			PlayerStats.del_item(PlayerStats.inventory[PlayerStats.currentInv]["Item"], 1)
	if Input.is_action_just_pressed("action_button") and PlayerStats.hoeEquipped:
		hoe_used()	
		

func hoe_used():
	var temp = EnvTilemap.world_to_map(Player.ActionTile.get_global_position())
	if EnvTilemap.get_cellv(temp) == 30:
		if FarmingTilemap.get_cellv(temp) == -1:
			FarmingTilemap.set_cellv(temp, 0)
			PlayerStats.farming_info[((temp.x + 6) * 7) + (temp.y - 1)] = 0
		if FarmingTilemap.get_cellv(temp) % 6 == 0 and FarmingTilemap.get_cellv(temp) != 0:
			if (PlayerStats.add_item((FarmingTilemap.get_cellv(temp)/ 6) + 3, 1)):
				FarmingTilemap.set_cellv(temp, -1)
				PlayerStats.farming_info[((temp.x + 6) * 7) + (temp.y - 1)] = -1
			

func plant_seed(loc):
	var id_to_set = (PlayerStats.inventory[PlayerStats.currentInv]["Item"] * 6) + 1
	FarmingTilemap.set_cellv(loc, id_to_set)
	PlayerStats.farming_info[((loc.x + 6) * 7) + (loc.y - 1)] = id_to_set

func highlightTile():
	if (PlayerStats.isEuipped or PlayerStats.isCarrying) and not PlayerStats.enterToggle:
		var temp = Highlighter.world_to_map(Player.ActionTile.get_global_position())
		Highlighter.set_cell(temp.x, temp.y, 0)
		Highlighter.set_cell(temp.x + 1, temp.y, -1)
		Highlighter.set_cell(temp.x - 1, temp.y, -1)
		Highlighter.set_cell(temp.x, temp.y + 1, -1)
		Highlighter.set_cell(temp.x, temp.y - 1, -1)
		Highlighter.set_cell(temp.x + 1, temp.y + 1, -1)
		Highlighter.set_cell(temp.x + 1, temp.y - 1, -1)
		Highlighter.set_cell(temp.x - 1, temp.y + 1, -1)
		Highlighter.set_cell(temp.x - 1, temp.y - 1, -1)
	else:
		var temp = Highlighter.world_to_map(Player.ActionTile.get_global_position())
		Highlighter.set_cell(temp.x, temp.y, -1)
		Highlighter.set_cell(temp.x + 1, temp.y, -1)
		Highlighter.set_cell(temp.x - 1, temp.y, -1)
		Highlighter.set_cell(temp.x, temp.y + 1, -1)
		Highlighter.set_cell(temp.x, temp.y - 1, -1)
		Highlighter.set_cell(temp.x + 1, temp.y + 1, -1)
		Highlighter.set_cell(temp.x + 1, temp.y - 1, -1)
		Highlighter.set_cell(temp.x - 1, temp.y + 1, -1)
		Highlighter.set_cell(temp.x - 1, temp.y - 1, -1)

func spawn_item(id, pos):
	var temp = PlayerStats.Item_Scene.instance()
	temp.set_item_id(id)
	temp.position = pos
	temp.item_setup()
	ItemLayer.add_child(temp)


func updateFarming():
	for i in range(-6, 9):
		for j in range(1, 8):
			FarmingTilemap.set_cell(i, j, PlayerStats.farming_info[((i + 6) * 7) + (j - 1)])
#			var cell_id = FarmingTilemap.get_cell(i, j)
#			if cell_id > 0 and (cell_id % 6) != 0:
#				FarmingTilemap.set_cell(i, j, cell_id + 1)
#				print("(" + str(i) + ", " + str(j) + "): " + str(cell_id))
				
func nextDay():
	var x = 0
	for i in range(-6, 9):
		for j in range(1, 8):
			var cell_id = FarmingTilemap.get_cell(i, j)
			if cell_id > 0 and (cell_id % 6) != 0:
				FarmingTilemap.set_cell(i, j, cell_id + 1)
				PlayerStats.farming_info[((i + 6) * 7) + (j - 1)] = cell_id + 1
				print("(" + str(i) + ", " + str(j) + "): " + str(cell_id))
	






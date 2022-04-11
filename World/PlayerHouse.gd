extends Node2D

#Entry Exit bools
var playerHouseExit = false
var tv = false
var dressing = false
var saveTrig = false

onready var Player = $Player
onready var Screen = $TVSet/TV/Screen
# Called when the node enters the scene tree for the first time.
func _ready():
	Player.position = PlayerStats.HouselastPos
	PlayerStats.isEuipped = false
	PlayerStats.hoeEquipped = false
	PlayerStats.axeEquipped = false
	PlayerStats.pickaxeEquipped = false
	Player.Player_Direction = "up"
	Player._on_Player_anim_change()
	Player.Start_Timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	action_pressed()


func _on_Area2D_body_entered(body):
	playerHouseExit = true
	PlayerStats.enterToggle = true


func _on_Area2D_body_exited(body):
	playerHouseExit = false
	PlayerStats.enterToggle = false


func action_pressed():
	if Input.is_action_just_pressed("action_button") and playerHouseExit:
		PlayerStats.HouselastPos = Player.position
		playerHouseExit = false
		Player.set_Rem_Time()
		get_tree().change_scene("res://World/World.tscn")
	if Input.is_action_just_pressed("action_button") and tv:
		if Screen.frame == 0:
			Screen.frame = rand_range(1, 3)
		elif Screen.frame <= 3:
			Screen.frame = 4
		else:
			Screen.frame = 0
	if Input.is_action_just_pressed("action_button") and dressing:
		PlayerStats.HouselastPos = Player.position
		PlayerStats.last_scene = "res://World/PlayerHouse.tscn"
		get_tree().change_scene("res://UI/CharacterCreator.tscn")
	if Input.is_action_just_pressed("action_button") and saveTrig:
		GameController.dayEnd = true
		get_tree().change_scene("res://UI/DayEnd.tscn")

func _on_TVArea_body_entered(body):
	tv = true
	Screen.visible = true

func _on_TVArea_body_exited(body):
	tv = false
	Screen.visible = false


func _on_DressingArea_body_entered(body):
	dressing = true


func _on_DressingArea_body_exited(body):
	dressing = false


func _on_SaveTrigger_body_entered(body):
	saveTrig = true


func _on_SaveTrigger_body_exited(body):
	saveTrig = false

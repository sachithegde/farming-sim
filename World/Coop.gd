extends Node2D


var coopExit = false
var fillHay = false
var fillWater = false

onready var Player = $YSort/Player
onready var HayPool = $HayPool/Sprite
onready var WaterPool = $WaterPool/Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerStats.Hay:
		HayPool.frame = 1
	if PlayerStats.Water:
		WaterPool.frame = 1
	Player.position = PlayerStats.CoopLastPos
	PlayerStats.isEuipped = false
	PlayerStats.hoeEquipped = false
	PlayerStats.axeEquipped = false
	PlayerStats.pickaxeEquipped = false
	Player.Player_Direction = "up"
	Player._on_Player_anim_change()
	Player.Start_Timer()
	if GameController.CoopToBeUpdated:
		nextDay()
		GameController.CoopToBeUpdated = false



func _process(delta):
	action_pressed()


func action_pressed():
	if Input.is_action_just_pressed("action_button") and coopExit:
		PlayerStats.CoopLastPos = Player.position
		coopExit = false
		Player.set_Rem_Time()
		get_tree().change_scene("res://World/World.tscn")
	if Input.is_action_just_pressed("action_button") and fillWater and not PlayerStats.Water:
		PlayerStats.Water = true
		WaterPool.frame = 1
	if Input.is_action_just_pressed("action_button") and fillHay and not PlayerStats.Hay:
		PlayerStats.Hay = true
		HayPool.frame = 1


func _on_Area2D_body_entered(body):
	coopExit = true
	PlayerStats.enterToggle = true
	


func _on_Area2D_body_exited(body):
	coopExit = false
	PlayerStats.enterToggle = false
	


func _on_WaterArea_body_entered(body):
	fillWater = true


func _on_WaterArea_body_exited(body):
	fillWater = false


func _on_HayArea_body_entered(body):
	fillHay = true


func _on_HayArea_body_exited(body):
	fillHay = false

func nextDay():
	get_tree().call_group("Time", "nextDay")

extends Node2D


var marketExit = false
var shop = false

onready var Player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	Player.position = PlayerStats.MarketLastPos
	PlayerStats.isEuipped = false
	PlayerStats.hoeEquipped = false
	PlayerStats.axeEquipped = false
	PlayerStats.pickaxeEquipped = false
	Player.Player_Direction = "up"
	Player._on_Player_anim_change()
	Player.Start_Timer()


func _process(_delta):
	action_pressed()


func action_pressed():
	if Input.is_action_just_pressed("action_button") and marketExit:
		PlayerStats.MarketLastPos = Player.position
		marketExit = false
		Player.set_Rem_Time()
		get_tree().change_scene("res://World/World.tscn")
	if Input.is_action_just_pressed("action_button") and shop:
		Player.canMove = false
		Player.ifIdle()
		$ShopKeeper/CanvasLayer/Popup.popup_centered()

func _on_MarketExit_body_entered(body):
	marketExit = true
	PlayerStats.enterToggle = true


func _on_MarketExit_body_exited(body):
	marketExit = false
	PlayerStats.enterToggle = false


func _on_Area2D_body_entered(body):
	shop = true


func _on_Area2D_body_exited(body):
	shop = false

extends KinematicBody2D

var Player_Speed = 2000
var Player_Velocity : Vector2 = Vector2.ZERO
var Player_Direction: String = "down"
var Player_Animation: String = "idle"


var doingAction = false
var canMove = true





signal anim_change
#signal carry_toggle


onready var Body = $Sprites/Body
onready var Top = $Sprites/Top_Clothes
onready var Shoe = $Sprites/Shoes
onready var Bottom = $Sprites/Bottom_Clothes
onready var Hair = $Sprites/Hair
onready var Tool = $Sprites/Tool
onready var Carry = $Sprites/Carry
onready var ActionTile = $ActionTile
onready var AnimPlayer = $AnimationPlayer
onready var Time = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("anim_change")
	toggle_carry()
	change_texture()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	action_pressed()
	if not doingAction and canMove:
		move()
		move_and_slide(Player_Velocity * delta)
	
	
	


func move():
	if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		Player_Velocity.y += Player_Speed
		if (Player_Animation != "walk" || Player_Direction != "down") && Player_Velocity.x == 0:
			Player_Direction = "down"
			ActionTile.position = Vector2(0, 6)
			Player_Animation = "walk"
			emit_signal("anim_change")
	elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		Player_Velocity.y -= Player_Speed
		if (Player_Animation != "walk" || Player_Direction != "up") && Player_Velocity.x == 0:
			Player_Direction = "up"
			ActionTile.position = Vector2(0, -6)
			Player_Animation = "walk"
			emit_signal("anim_change")
	else:
		Player_Velocity.y = 0
		
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		Player_Velocity.x -= Player_Speed
		if Player_Animation != "walk" || Player_Direction != "left":
			Player_Direction = "left"
			ActionTile.position = Vector2(-6, 0)
			Player_Animation = "walk"
			emit_signal("anim_change")
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		Player_Velocity.x += Player_Speed
		if Player_Animation != "walk" || Player_Direction != "right":
			Player_Direction = "right"
			ActionTile.position = Vector2(6, 0)
			Player_Animation = "walk"
			emit_signal("anim_change")
	else:
		Player_Velocity.x = 0
	
	
	
	Player_Velocity = Player_Velocity.normalized() * Player_Speed
	
	ifIdle()
	
	
#	

func ifIdle():
	if Player_Velocity.x == 0 && Player_Velocity.y == 0 && Player_Animation != "idle":
		Player_Animation = "idle"
		emit_signal("anim_change")


func action_pressed():
	if Input.is_action_just_pressed("action_button") and PlayerStats.isEuipped and not PlayerStats.enterToggle:
		doingAction = true
		Tool.visible = true
		Player_Animation = "tool"
		change_frames(5)
		if PlayerStats.hoeEquipped:
			PlayerStats.anim_state = "hoe"
			PlayerStats.load_textures()
			emit_signal("anim_change")
		elif PlayerStats.axeEquipped:
			PlayerStats.anim_state = "axe"
			PlayerStats.load_textures()
			emit_signal("anim_change")
		elif PlayerStats.pickaxeEquipped:
			PlayerStats.anim_state = "pickaxe"
			PlayerStats.load_textures()
			emit_signal("anim_change")
		


func _on_Player_anim_change():
	AnimPlayer.play(Player_Animation + "_" + Player_Direction)


func toggle_carry():
	
	if PlayerStats.isCarrying == true:
		PlayerStats.anim_state = "carry"
		PlayerStats.load_textures()
		Carry.frame = PlayerStats.inventory[PlayerStats.currentInv]["Item"]
	else:
		PlayerStats.anim_state = "walk"
		PlayerStats.load_textures()
		Carry.frame = 4



func change_texture():
	Body.texture = load(PlayerStats.body_texture)
	Top.texture = load(PlayerStats.top_texture)
	Shoe.texture = load(PlayerStats.shoe_texture)
	Bottom.texture = load(PlayerStats.bottom_texture)
	Hair.texture = load(PlayerStats.hair_texture)
	Tool.texture = load(PlayerStats.tool_texture)
	


func change_frames(noOfFrames):
	Body.hframes = noOfFrames
	Top.hframes = noOfFrames
	Bottom.hframes = noOfFrames
	Shoe.hframes = noOfFrames
	Hair.hframes = noOfFrames
	Tool.hframes = noOfFrames





func _on_AnimationPlayer_animation_finished(_anim_name):
	print("AnimFinished")
	PlayerStats.anim_state = "walk"
	Player_Animation = "idle"
	PlayerStats.load_textures()
	change_frames(8)
	doingAction = false
	Tool.visible = false
	emit_signal("anim_change")

#Time Mechanics

func Start_Timer():
	if GameController.remainingTime == -1:
		Time.start(GameController.HOURTIME)
	else:
		Time.start(GameController.remainingTime)
		GameController.remainingTime = -1

func set_Rem_Time():
	GameController.remainingTime = Time.time_left

func _on_Timer_timeout():
	GameController.isDayEnd()

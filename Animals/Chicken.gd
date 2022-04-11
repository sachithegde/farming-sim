extends KinematicBody2D

export var destination = Vector2.ZERO
export var direction = "down" 
export var velocity = Vector2.ZERO
export var move_speed = 1500
export var old = false
export var hasEgg = false
export var canEgg = false
export var age = 1

onready var AnimPlayer = $AnimationPlayer




# Called when the node enters the scene tree for the first time.
func _ready():
	if old:
		$ChickenSprite.texture = load("res://Assets/Animals/chicken animation.png")
		hasEgg = true
func _process(delta):
	if Input.is_action_just_pressed("action_button") and hasEgg and canEgg:
		if PlayerStats.add_item(11, 1):
			hasEgg = false
	if Input.is_action_just_pressed("testing"):
		get_point()

func _physics_process(delta):
	if velocity.x != 0 and velocity.y != 0:
		move_and_slide(velocity * delta * move_speed)
		check_on_path()
	check_reached()

func get_point():
	randomize()
	var Dest_Temp = get_tree().get_root().find_node("Destinations", true, false)
	var count = Dest_Temp.get_child_count()
	var temp = Dest_Temp.get_child(randi()%count).position
	if temp == destination:
		get_point()
	else:
		destination = temp
		get_velocity()
		
		
func get_velocity():
	anim_state()
	velocity = (destination - position).normalized()

func check_reached():
	if position.distance_to(destination) < 5:
		velocity = Vector2.ZERO
		direction = "idle"
		AnimPlayer.play("idle")

func anim_state():
	var temp = rad2deg(position.angle_to_point(destination))
	if (temp > -45 && temp <= 45):
		direction = "left"
	elif (temp > -135 && temp <= -45):
		direction = "down"
	elif (temp > 45 && temp <= 135):
		direction = "up"
	elif (temp > 135 && temp <= 180) || (temp > -180 && temp <= -135):
		direction = "right"
	else:
		direction = "idle"
	
	AnimPlayer.play(direction)
	
func check_on_path():
	if (velocity != ((destination - position).normalized())):
		get_velocity()

func loadResource():
	hasEgg = true


func _on_Milking_body_entered(body):
	canEgg = true


func _on_Milking_body_exited(body):
	canEgg = false


func nextDay():
	age += 1
	if age > 5:
		old = true

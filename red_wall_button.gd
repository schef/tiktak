extends Node2D

@onready var area2d: Area2D = $Area2D
@onready var animation: AnimationPlayer = $AnimationPlayer

signal on_mouse_over
signal on_mouse_click

var description = "A strange red button."
var mouse_clicked = false
var mouse_entered = false
var player_entered = false

func _ready():
	area2d.mouse_entered.connect(_on_area2d_mouse_entered)
	area2d.mouse_exited.connect(_on_area2d_mouse_exited)
	area2d.area_entered.connect(_on_area2d_body_entered)
	area2d.area_exited.connect(_on_area2d_body_exited)
	
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		mouse_clicked = mouse_entered
		check_animation()

func _on_area2d_mouse_entered():
	mouse_entered = true
	self.emit_signal("on_mouse_over", description)

func _on_area2d_mouse_exited():
	mouse_entered = false
	self.emit_signal("on_mouse_over")

func _on_area2d_body_entered(area2d: Area2D):
	if area2d.name == "player_area":
		player_entered = true
		check_animation()

func _on_area2d_body_exited(area2d: Area2D):
	if area2d.name == "player_area":
		player_entered = false

func check_animation():
	print(animation.assigned_animation)
	if mouse_clicked and player_entered:
		animation.play("blink")

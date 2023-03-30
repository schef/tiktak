class_name Thing
extends Node2D

@onready var player_detect_area: Area2D = $PlayerDetectArea
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer = $AudioStreamPlayer

signal on_mouse_over
signal on_mouse_clicked
signal on_animation_finished

var description = "Description"
var mouse_clicked = false
var mouse_entered = false
var player_entered = false

func _ready():
	player_detect_area.mouse_entered.connect(_on_area2d_mouse_entered)
	player_detect_area.mouse_exited.connect(_on_area2d_mouse_exited)
	player_detect_area.area_entered.connect(_on_area2d_body_entered)
	player_detect_area.area_exited.connect(_on_area2d_body_exited)
	animation.animation_finished.connect(_on_animation_player_animation_finished)
	
func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		mouse_clicked = mouse_entered
		_check_animation()

func _on_area2d_mouse_entered():
	mouse_entered = true
	self.emit_signal("on_mouse_over", description)

func _on_area2d_mouse_exited():
	mouse_entered = false
	self.emit_signal("on_mouse_over")

func _on_area2d_body_entered(area2d: Area2D):
	if area2d.name == "player_area":
		player_entered = true
		_check_animation()

func _on_area2d_body_exited(area2d: Area2D):
	if area2d.name == "player_area":
		player_entered = false

func _check_animation():
	if mouse_clicked and player_entered:
		self.emit_signal("on_mouse_clicked", self)

func _on_animation_player_animation_finished(anim_name: String):
	self.emit_signal("on_animation_finished", self, anim_name)

func get_animation() -> String:
	return animation.current_animation

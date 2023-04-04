extends Node2D

@onready var animation = $AnimationPlayer
@onready var button_sound = $AudioStreamPlayerButton
@onready var button1 = $CanvasLayer/VBoxContainer/Button
@onready var button2 = $CanvasLayer/VBoxContainer/Button2
@onready var button3 = $CanvasLayer/VBoxContainer/Button3
@onready var button4 = $CanvasLayer/VBoxContainer/Button4


func _ready():
	animation.play("default")
	button1.mouse_entered.connect(_on_mouse_entered)
	button1.pressed.connect(_on_mouse_pressed)
	button2.mouse_entered.connect(_on_mouse_entered)
	button3.mouse_entered.connect(_on_mouse_entered)
	button4.mouse_entered.connect(_on_mouse_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	button_sound.play(0.16)
	
func _on_mouse_pressed():
		SceneTransition.change_scene_to_file("res://source/levels/level_first.tscn")

extends Node2D

@onready var animation = $AnimationPlayer
@onready var button_sound = $AudioStreamPlayerButton
@onready var button1 = $VBoxContainer/Button
@onready var button2 = $VBoxContainer/Button2
@onready var button3 = $VBoxContainer/Button3
@onready var button4 = $VBoxContainer/Button4


func _ready():
	animation.play("default")
	button1.mouse_entered.connect(_on_mouse_entered)
	button2.mouse_entered.connect(_on_mouse_entered)
	button3.mouse_entered.connect(_on_mouse_entered)
	button4.mouse_entered.connect(_on_mouse_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	button_sound.play(0.16)

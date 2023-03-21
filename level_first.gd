extends Node2D
@onready var player: Player = $Player
@onready var label: Label = $CanvasLayer/Label

func _ready():
	var things = $Things.get_children()
	for thing in things:
		thing.on_mouse_over.connect(on_mouse_over)

func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		player.set_destination(get_global_mouse_position())

func on_mouse_over(description = ""):
	print("on_mouse_over")
	label.text = description

extends Node2D
@onready var player: Player = $Player
@onready var label: Label = $CanvasLayer/Label

@onready var door: Thing = $Things/SpaceShipPortalDoor
@onready var button: Thing = $Things/RedWallButton

func _ready():
	var things = $Things.get_children()
	for thing in things:
		thing.on_mouse_over.connect(_on_mouse_over)
		thing.on_mouse_clicked.connect(_on_mouse_clicked)
		thing.on_animation_finished.connect(_on_animation_finished)
	_load_scene()

func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		player.set_destination(get_global_mouse_position())

func _on_mouse_over(description = ""):
	print("on_mouse_over")
	label.text = description

func _load_scene():
	button.off()
	door.closed()

func _on_mouse_clicked(thing):
	if thing != null:
		if thing == button:
			if not door.is_opened():
				button.blink()
				door.opening()

func _on_animation_finished(thing, anim_name):
	if thing == door:
		if anim_name == "opening":
			button.on()
			door.opened()

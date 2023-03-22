extends Node2D
@onready var player: Player = %Player
@onready var label: Label = $CanvasLayer/Label

@onready var door: Thing = $Things/SpaceShipPortalDoor
@onready var button: Thing = $Things/RedWallButton
@onready var sphere_table: SphereTable = $Things/SphereTable

func _ready():
	var things = $Things.get_children()
	for thing in things:
		if thing is Thing:
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
	label.text = description

func _load_scene():
	button.toff()
	door.tclosed()
	sphere_table.thidden()

func _on_mouse_clicked(thing):
	if thing != null:
		if thing == button:
			sphere_table.trise()

func _on_animation_finished(thing, anim_name):
	if thing == sphere_table:
		if anim_name == "rise":
			sphere_table.trotate()

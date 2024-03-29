extends Node2D
@onready var player: Player = %Player
@onready var label: Label = $CanvasLayer/Label

@onready var door: Thing = $Things/SpaceShipPortalDoor
@onready var button: Thing = $Things/RedWallButton
@onready var sphere_table: SphereTable = $Things/SphereTable
@onready var background_player = $AudioStreamPlayer

func _ready():
	var things = $Things.get_children()
	for thing in things:
		if thing is Thing:
			thing.on_mouse_over.connect(_on_mouse_over)
			thing.on_mouse_clicked.connect(_on_mouse_clicked)
			thing.on_animation_finished.connect(_on_animation_finished)
	_load_scene()
	background_player.play()

func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		player.set_destination(get_global_mouse_position())

func _on_mouse_over(description = ""):
	label.text = description

func _load_scene():
	button.toff()
	door.thidden()
	sphere_table.thidden()

func _on_mouse_clicked(thing):
	if thing != null:
		if thing == button:
			sphere_table.tlifting()
		if thing == sphere_table:
			door.topening()

func _on_animation_finished(thing, anim_name):
	if thing == sphere_table:
		if anim_name == sphere_table.ANIM.LIFTING:
			sphere_table.tloop()
	elif thing == door:
		if anim_name == door.ANIM.OPENING:
			door.topened()

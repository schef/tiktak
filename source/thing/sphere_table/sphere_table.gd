class_name SphereTable
extends Thing

func _ready():
	super._ready()

func thidden():
	visible = false
	animation.play("hidden")

func trise():
	description = "Sphere show yourself"
	visible = true
	animation.play("rise")

func trotate():
	description = "Sphere"
	visible = true
	animation.play("rotate")

class_name SphereTable
extends Thing

const ANIM := {
	HIDDEN = "hidden",
	LIFTING = "lifting",
	LOOP = "loop"
}

func _ready():
	super._ready()

func thidden():
	visible = false
	animation.play(ANIM.HIDDEN)

func tlifting():
	description = "Sphere show yourself"
	visible = true
	animation.play(ANIM.LIFTING)
	sound.play()

func tloop():
	description = "Sphere"
	visible = true
	animation.play(ANIM.LOOP)
	sound.stop()

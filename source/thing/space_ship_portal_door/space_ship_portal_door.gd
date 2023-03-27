extends Thing

const ANIM := {
	HIDDEN = "hidden",
	OPENING = "opening",
	OPENED = "opened"
}

func _ready():
	super._ready()

func thidden():
	description = "A stranged closed door!"
	visible = false
	animation.play(ANIM.HIDDEN)

func topening():
	description = "A stranged opening door!"
	visible = true
	animation.play(ANIM.OPENING)

func topened():
	description = "A strange opened door!"
	visible = true
	animation.play(ANIM.OPENED)

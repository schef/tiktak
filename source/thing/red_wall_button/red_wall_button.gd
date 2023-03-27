extends Thing

const ANIM := {
	OFF = "off",
	ON = "on",
	TOGGLE = "toggle"
}

func _ready():
	super._ready()

func toff():
	description = "A big red OFF button!"
	animation.play(ANIM.OFF)

func tblink():
	description = "A big red BLINK button!"
	animation.play(ANIM.TOGGLE)

func ton():
	description = "A big red ON button!"
	animation.play(ANIM.ON)

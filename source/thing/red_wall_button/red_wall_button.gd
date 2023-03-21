extends Thing

func _ready():
	super._ready()

func off():
	description = "A big red OFF button!"
	animation.play("off")

func blink():
	description = "A big red BLINK button!"
	animation.play("blink")

func on():
	description = "A big red ON button!"
	animation.play("on")

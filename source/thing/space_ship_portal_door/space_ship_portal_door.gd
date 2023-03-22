extends Thing

func _ready():
	super._ready()

func tclosed():
	description = "A stranged closed door!"
	visible = false
	animation.play("closed")

func topening():
	description = "A stranged opening door!"
	visible = true
	animation.play("opening")

func topened():
	description = "A strange opened door!"
	visible = true
	animation.play("opened")

func tis_opened():
	return animation.current_animation == "opened"

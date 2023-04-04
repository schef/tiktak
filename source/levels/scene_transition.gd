extends CanvasLayer

func change_scene_to_file(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://source/levels/level_first.tscn")
	$AnimationPlayer.play_backwards("dissolve")
	

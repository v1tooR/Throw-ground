extends Area2D


func _on_coletavel_body_entered(body: Node) -> void:
	$Animate.play("collected")

func _on_AnimatedSprite_animation_finished(Animate_name: String) -> void:
	if Animate_name == "collected":
		queue_free()

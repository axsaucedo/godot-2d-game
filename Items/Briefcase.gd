extends Area2D

signal collect_briefcase

func _on_Briefcase_body_entered(body):
	emit_signal("collect_briefcase")
	queue_free()

extends MeshInstance

var speed = 1
var direction = Vector3.ZERO


func init(dir):
	direction = dir


func _physics_process(_delta):
	global_translate(direction * speed)


func _on_Timer_timeout():
	queue_free()

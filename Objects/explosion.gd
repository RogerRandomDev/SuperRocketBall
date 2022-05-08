extends GPUParticles2D
class_name explosion_projectile

var t=Sprite2D.new()
func _ready():
	amount=12
	emitting=true
	one_shot=true
	explosiveness=1.0
	
	texture=load("res://textures/smoke.png")
	process_material=load("res://textures/explosion.tres")
	
	t.texture=load("res://textures/explosionFlash.png")
	add_child(t)
	t.self_modulate=Color(1,1,1,0.5)
#	t.scale=Vector2.ZERO
	var tween:Tween=create_tween()
	tween.tween_property(t,"scale",Vector2(2,2),0.125)
	tween.tween_property(t,"scale",Vector2(0.0,0.0),0.0625)

func _process(_delta):
	if !emitting:queue_free()

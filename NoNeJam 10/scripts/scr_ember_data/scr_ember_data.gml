

// Create systems here
enum EmberSys {
	Default	
}

ember_system_create(EmberSys.Default)
ember_system_depth(EmberSys.Default, 300) // TODO adjust based on player depth or another sorting system
// Create emitters here

enum EmberEmit {
}


// Create types here
enum EmberType {
	Walk,
	Hit,
	Explosion1,
	CasingBrass,
	CasingRed,
	MuzzleFlash,
	LaserFocus,
}


ember_type_create(EmberType.Walk).
sprite(spr_dust).
size(0.7, 1.2).
spd(0.4, 1.2, -0.1).
direc(40, 140).
grav(-0.013, 90).
mix(c_white, c_ltgray).
life(5, 20).
save()


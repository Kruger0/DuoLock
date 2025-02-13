event_inherited()

interact()
movement()

velz -= grav

if (z >= 0) { // tá pra cima
	velz = 0
}

take_dmg()

z = min(0, z - velz)


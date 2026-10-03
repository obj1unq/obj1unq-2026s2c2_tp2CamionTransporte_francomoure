object auto {
	const abejorro = bumblebee
	
	method peligrosidad() = 15
	
	method accidentar() {
		abejorro.modoActual(robot)
	}
}

object robot {
	const abejorro = bumblebee
	
	method peligrosidad() = 30
	
	method accidentar() {
		abejorro.modoActual(auto)
	}
}

object knightRider {
	method peso() = 500
	
	method nivelDePeligrosidad() = 10
	
	method cantidadDeBultos() = 1
	
	method accidentar() {
		
	}
}

object arenaAGranel {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method peligrosidad() = 1
	
	method cantidadDeBultos() = 1
	
	method accidentar() {
		peso += 20
	}
}

object bumblebee {
	var modoActual = auto
	
	method peligrosidad() = modoActual.peligrosidad()
	
	method modoActual(_modoActual) {
		modoActual = _modoActual
	}
	
	method modoActual() = modoActual
	
	method peso() = 800
	
	method cantidadDeBultos() = 2
	
	method accidentar() {
		modoActual.accidentar()
	}
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 2
	
	method cantidadDeLadrillos(_cantidadDeLadrillos) {
		cantidadDeLadrillos = _cantidadDeLadrillos
	}
	
	method cantidadDeLadrillos() = cantidadDeLadrillos
	
	method peso() = 2 * cantidadDeLadrillos
	
	method peligrosidad() = 2
	
	method cantidadDeBultos() {
		if (cantidadDeLadrillos < 101) {
			return 1
		} else {
			if ((cantidadDeLadrillos >= 101) && (cantidadDeLadrillos < 301)) {
				return 2
			} else {
				return 3
			}
		}
	}
	
	method accidentar() {
		if (cantidadDeLadrillos <= 12) {
			cantidadDeLadrillos = 0
		} else {
			cantidadDeLadrillos -= 12
		}
	}
}

object bateriaAntiaerea {
	var property estaConMisiles = false
	
	method peso() {
		if (estaConMisiles) {
			return conMisiles.peso()
		} else {
			return sinMisiles.peso()
		}
	}
	
	method peligrosidad() {
		if (estaConMisiles) {
			return conMisiles.peligrosidad()
		} else {
			return sinMisiles.peligrosidad()
		}
	}
	
	method cantidadDeBultos() {
		if (not estaConMisiles) {
			return sinMisiles.cantidadDeBultos()
		} else {
			return conMisiles.cantidadDeBultos()
		}
	}
	
	method accidentar() {
		estaConMisiles = false
	}
}

object conMisiles {
	method peso() = 300
	
	method peligrosidad() = 10
	
	method cantidadDeBultos() = 2
}

object sinMisiles {
	method peso() = 200
	
	method peligrosidad() = 0
	
	method cantidadDeBultos() = 1
}

object residuosRadioactivos {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method peligrosidad() = 200
	
	method accidentar() {
		peso += 15
	}
}

object contenedorPortuario {
	const elementosQueContiene = #{}
	
	method peligrosidadDelMasPeligroso() = elementosQueContiene.map(
		{ elemento => elemento.peligrosidad() }
	).max()
	
	method peligrosidad() {
		if (elementosQueContiene.size() == 0) {
			return 0
		} else {
			return self.peligrosidadDelMasPeligroso()
		}
	}
	
	method peso() = 100 + elementosQueContiene.sum({ elemento => elemento.peso() })
	
	method cantidadBultosQueContiene() = elementosQueContiene.sum(
		{ elemento => elemento.cantidadDeBultos() }
	)
	
	method cantidadDeBultos() = 1 + self.cantidadBultosQueContiene()
	
	method accidentar() {
		elementosQueContiene.foreach({ elem => elem.accidentar() })
	}
}

object embalajeDeSeguridad {
	var property elementoAlQueEnvuelve = contenedorPortuario
	
	method peso() = elementoAlQueEnvuelve.peso()
	
	method peligrosidad() = elementoAlQueEnvuelve.peligrosidad() / 2
	
	method cantidadDeBultos() = 2
	
	method accidentar() {
		
	}
}

object almacen {
	const elementosAlmacenados = #{}
	
	method elementosAlmacenados() = elementosAlmacenados
	
	method almacenar(elementos) {
		elementos.forEach({ elem => elementosAlmacenados.add(elem) })
	}
}

object ruta9 {
	method soportaViaje(vehiculo) = vehiculo.puedeCircularEnRuta(20)
}

object caminosVecinales {
	var pesoMaximo = 2000
	
	method pesoMaximo() = pesoMaximo
	
	method pesoMaximo(_pesoMaximo) {
		pesoMaximo = _pesoMaximo
	}
	
	method soportaViaje(vehiculo) = vehiculo.pesoTotal() <= pesoMaximo
}
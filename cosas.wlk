object auto {
	
}

object robot {
	
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
	
	method peligrosidad() {
		if (modoActual == auto) {
			return 15
		} else {
			return 30
		}
	}
	
	method modoActual(_modoActual) {
		modoActual = _modoActual
	}
	
	method modoActual() = modoActual
	
	method peso() = 800
	
	method cantidadDeBultos() = 2
	
	method accidentar() {
		if (modoActual == auto) self.modoActual(robot) else self.modoActual(auto)
	}
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 2
	
	method cantidadDeLadrillos(_cantidadDeLadrillos) {
		cantidadDeLadrillos = _cantidadDeLadrillos
	}
	
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
	var estaConMisiles = false
	
	method peso() {
		if (estaConMisiles) {
			return 300
		} else {
			return 200
		}
	}
	
	method peligrosidad() {
		if (estaConMisiles) {
			return 100
		} else {
			return 0
		}
	}
	
	method cantidadDeBultos() {
		if (not estaConMisiles) {
			return 1
		} else {
			return 2
		}
	}
	
	method accidentar() {
		estaConMisiles = False
	}
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
	var elementosQueContiene = #{}
	
	method peligrosidad() {
		if (elementosQueContiene.size() == 0) {
			return 0
		} else {
			return elementosQueContiene.map(
				{ elemento => elemento.peligrosidad() }
			).max()
		}
	}
	
	method peso() = 100 + elementosQueContiene.sum({ elemento => elemento.peso() })
	
	method cantidadDeBultos() = 1 + elementosQueContiene.sum(
		{ elem => elem.cantidadDeBultos() }
	)
	
	method accidentar() {
		elementosQueContiene = elementosQueContiene.map({ elem => elem.accidentar() })
	}
}

object embalajeDeSeguridad {
	const elementoAlQueEnvuelve = contenedorPortuario
	
	method peso() = elementoAlQueEnvuelve.peso()
	
	method peligrosidad() = elementoAlQueEnvuelve.peligrosidad() / 2
	
	method cantidadDeBultos() = 2
	
	method accidentar() {
		
	}
}

object almacen {
	var elementosAlmacenados = #{knightRider, residuosRadioactivos}
	
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
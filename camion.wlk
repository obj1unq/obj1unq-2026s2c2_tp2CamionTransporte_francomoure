import cosas.*

object camion {
	const property cosas = #{}
	var miAlmacen = almacen
	
	method cargar(cosa) {
		self.validarCargar(cosa)
		cosas.add(cosa)
	}
	
	method validarCargar(cosa) {
		if (self.estaLaCosa(cosa)) self.error("cosa ya cargada")
	}
	
	method descargar(cosa) {
		self.validarDescargar(cosa)
		cosas.remove(cosa)
	}
	
	method validarDescargar(cosa) {
		if (not self.estaLaCosa(cosa)) self.error(
				"no puede descargar porque la cosa no está"
			)
	}
	
	//acá quizás uso un any si no hay un pertenece pre definido	
	method estaLaCosa(cosa) = cosas.any({ unaCosa => unaCosa == cosa })
	
	method todoPesoPar() = cosas.all({ cosa => cosa.peso().even() })
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method pesoDeLasCosas() = cosas.sum({ cosa => cosa.peso() })
	
	method pesoTotal() = 1000 + self.pesoDeLasCosas()
	
	method excesoDePeso() = self.pesoTotal() > 2500
	
	method elDeNivel(nivel) = cosas.find(
		{ cosa => cosa.nivelDePeligrosidad() == nivel }
	)
	
	method cosasMasPeligrosasQue(nivel) = cosas.find(
		{ cosa => cosa.nivelDePeligrosidad() > nivel }
	)
	
	method coleccionDeCosasMasPeligrosasQue(nivel) = cosas.filter(
		{ cosa => cosa.nivelDePeligrosidad() > nivel }
	)
	
	method puedeCircularEnRuta(
		nivelDePeligrosidadDeRuta
	) = (not self.excesoDePeso()) && self.coleccionDeCosasMasPeligrosasQue(
		nivelDePeligrosidadDeRuta
	).isEmpty()
	
	method tieneAlgoQuePesaEntre(num1, num2) = cosas.any(
		{ cosa => cosa.peso().between(num1, num2) }
	)
	
	method elementoMasPesado() = cosas.max({ cosa => cosa.peso() })
	
	method pesoDeCadaElemento() = cosas.map({ cosa => cosa.peso() })
	
	method totalDeBultos() = cosas.sum({ cosa => cosa.cantidadDeBultos() })
	
	method accidentar() {
		cosas.foreach({ cosa => cosa.accidentar() })
	}
	
	method transportar(destino, camino) {
		self.validarTransportar(destino, camino)
		miAlmacen.almacenar(cosas)
		cosas.clear()
	}
	
	method validarTransportar(destino, camino) {
		if (not camino.soportaViaje(self)) self.error("no soporta el camino")
	}
}
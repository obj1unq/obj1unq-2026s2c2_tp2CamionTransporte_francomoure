import cosas.*

object camion {
	var cosas = #{}
	var miAlmacen = almacen
	
	method cargar(cosa) {
		self.validarCargar(cosa)
		cosas.add(cosa)
	}
	
	method validarCargar(cosa) {
		if (self.estaLaCosa(cosa, cosas)) self.error("cosa ya cargada")
	}
	
	method descargar(cosa) {
		self.validarDescargar(cosa)
		cosas.remove(cosa)
	}
	
	method validarDescargar(cosa) {
		if (not self.estaLaCosa(cosa, cosas)) self.error(
				"no puede descargar porque la cosa no está"
			)
	}
	
	//acá quizás uso un any si no hay un pertenece pre definido	
	method estaLaCosa(cosa, cosas) = cosas.any({ unaCosa => unaCosa == cosa })
	
	method todoPesoPar() = cosas.all({ cosa => null.esPar(cosa.peso()) })
	
	method esPar(n) = (n % 2) == 0
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method pesoTotal() = 1000 + cosas.sum({ cosa => cosa.peso() })
	
	method excesoDePeso() = self.pesoTotal() > 2500
	
	method elDeNivel(nivel) = cosas.filter(
		{ cosa => cosas.nivelDePeligrosidad() == nivel }
	)
	
	//me tiene que devolver una cosa pero esto me devuelve una lista...
	method cosasMasPeligrosasQue(nivel) = cosas.filter(
		{ cosa => cosa.nivelDePeligrosidad() > nivel }
	)
	
	method puedeCircularEnRuta(
		nivelDePeligrosidadDeRuta
	) = (not self.excesoDePeso()) && (null.length(
		self.cosasMasPeligrosasQue(nivelDePeligrosidadDeRuta)
	) == 0)
	
	method tieneAlgoQuePesaEntre(num1, num2) = cosas.any(
		{ cosa => (cosa.peso() >= num1) && (cosa.peso() <= num2) }
	)
	
	method elementoMasPesado() {
		var mayorPeso = cosas.max({ cosa => cosa.peso() })
		return cosas.filter({ cosa => cosa.peso() == mayorPeso })
	}
	
	//pero que pasaría si hay dos con el mismo peso? no me serviría
	//me cuesta entender cómo devolver un objeto en vez de un mensaje de ese objeto
	method pesoDeCadaElemento() = cosas.map({ cosa => cosa.peso() })
	
	method totalDeBultos() = cosas.sum({ cosa => cosa.cantidadDeBultos() })
	
	method accidentar() {
		cosas = cosas.map({ cosa => cosa.accidentar() })
	}
	
	method transportar(destino, camino) {
		self.validarTransportar(destino, camino) //validar ruta
		miAlmacen.almacenar(cosas)
		cosas = cosas.clear()
	}
	
	method validarTransportar(destino, camino) {
		if (not camino.soportaViaje(self)) self.error("no soporta el camino")
	}
}
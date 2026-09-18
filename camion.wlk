import cosas.*

object camion{
	var cosas = #{}
	var miAlmacen = almacen	

	method cargar(cosa){
		validarCargar(cosa)
		cosas.add(cosa)	
	}

	method validarCargar(cosa){
		if(self.estaLaCosa(cosa, cosas)){
			self.error("cosa ya cargada")
		}
	}

	method descargar(cosa){
		validarDescargar(cosa)
		cosas.remove(cosa)
	}

	method validarDescargar(cosa){
		if(not self.estaLaCosa(cosa, cosas)){
			self.error("no puede descargar porque la cosa no está")
		}	
	}

	//acá quizás uso un any si no hay un pertenece pre definido	
	method estaLaCosa(cosa, cosas){
		
	}

	method todoPesoPar(){
		return cosas.all({cosa => esPar(cosa.peso())})
	}

	method esPar(n){
		return (n % 2 == 0)
	}

	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}


	method pesoTotal(){
		return 1000 + cosas.sum({cosa => cosa.peso()})
	}

	method excesoDePeso(){
		return self.pesoTotal() > 2500
	}

	method elDeNivel(nivel){
		return cosas.filter({cosa => cosas.nivelDePeligrosidad() == nivel})
	}//me tiene que devolver una cosa pero esto me devuelve una lista...

	method cosasMasPeligrosasQue(nivel){
		return cosas.filter({cosa => cosa.nivelDePeligrosidad > nivel})
	}

	method puedeCircularEnRuta(nivelDePeligrosidadDeRuta){
		return not self.excesoDePeso() && length (self.cosasMasPeligrosasQue(nivelDePeligrosidadDeRuta)) == 0
	}
	
	
	method tieneAlgoQuePesaEntre(num1,num2){
		return cosas.any({cosa => cosa.peso() >= num1 && cosa.peso() <= num2 })
	}

	method elementoMasPesado(){
		var mayorPeso = cosas.max({cosa => cosa.peso()})
		return cosas.filter({cosa => cosa.peso() == mayorPeso})
	}//pero que pasaría si hay dos con el mismo peso, no me serviría

	method pesoDeCadaElemento(){
		return cosas.map({cosa => cosa.peso()})
	}

	method totalDeBultos(){
		return cosas.sum({cosa => cosa.cantidadDeBultos()})
	}

	method accidentar(){
		cosas = cosas.map({cosa => cosa.accidentar()})
	}

	
	method transportar(destino, camino){
		self.validarTransportar(destino, camino)//validar ruta
		miAlmacen.almacenar(cosas)
		cosas = cosas.clear()
	}

	method validarTransportar(){
		if(not camino.soportaViaje(self)){
			return self.error("no soporta el camino")
		}
	}
}

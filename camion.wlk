import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
}

object knightRider{
	var nivelDePeligrosidad = 10
	var 
	
	method nivelDePeligrosidad{
		return nivelDePeligrosidad
	}
	
}
object arenaGranel{}
object bumblebee{}
object paqueteLadrillos{}
object bateriaAntiaerea{}
object residuosRadioactivos{}

object camion{
	var carga = []

	method cargar(item){
		//validacion acá primero
		if not perteneceALista(item, carga){
			carga.add(item)
		}
	}

	method descargar(item){
		validarDescargar(item)
		//valido descargar el item con ese if, y dejo carga.remove(item)
		if perteneceALista(item, carga){
			carga.remove(item)
		}else{
			self.error("")
		}
		
	}

	method todoPesoPar(){
		return carga.all({item => esPar(item)})
	}

	method hayAlgunoQuePesa(peso){
		return carga.any
	}

	method pesoTotal(){
		return 1000 + carga.sum(peso de los items)
	}

	method excesoDePeso(){
		return self.pesoTotal() > 2500
	}

	method elDeNivel(nivel){
		return carga.filter(nivelDePeligrosidad == nivel)
	}
}

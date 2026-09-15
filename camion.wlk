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

	method cosas(){
		return cosas
	}

	method cargar(item){
		//validacion acá primero?? no sé porque no sé si debe dar error o simplemente no hacer nada
		if not perteneceALista(item, carga){
			carga.add(item)
		}
	}

	method descargar(item){
		validarDescargar(item)
		//valido descargar el item con ese if, y dejo carga.remove(item), lo mismo
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

	method cosasMasPeligrosasQue(cosa1, cosa2){
			return cosa1.nivelDePeligrosidad > cosa2.nivelDePeligrosidad
	}

	method esMasPeligrosoQue(cosa1, nivel){
		return cosa1.nivelDePeligrosidad > nivel
	}
}

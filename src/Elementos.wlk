import plagas.*

class Elementos {
	
		var property esBueno 
		
			
}

class Hogar {
	
		var property nivelDeMugre = 0
		var property confort
	
			method esBueno(){return nivelDeMugre/2 <= confort }	
			method serAtacado(plaga){nivelDeMugre+=plaga.nivelDeDanio()}
			
}

object nivelDeProduccion {
	
		var property nivel = 2
}
class Huerta {
	
		var property capacidadDeProduccion
		const property nivel = nivelDeProduccion
		
		method esBueno(){return nivel.nivel()<capacidadDeProduccion}
		method serAtacado(plaga){
			capacidadDeProduccion-=plaga.nivelDeDanio()*0.1
				if(plaga.transmiteEnfermedades()){capacidadDeProduccion-=10}
		}
		
}
class Mascota {
	
		var property nivelDeSalud
		
			method esBueno(){return nivelDeSalud>250}
			method serAtacado(plaga){
				if(plaga.transmiteEnfermedades()){
					nivelDeSalud-=plaga.nivelDeDanio()
				}
			}
			
}


class Barrio {
	
		const elementos = []
		
			method agregarElemento(elemento){elementos.add(elemento)}
			method quitarElemento(elemento){elementos.remove(elemento)}
			method elementosBuenos(){return elementos.map{a=>a.esBueno()}}
			method elementosMalos(){return elementos.map{a=>not a.esBueno()}}
			method esCopado(){return self.elementosBuenos().size()>self.elementosMalos().size()}
			
}
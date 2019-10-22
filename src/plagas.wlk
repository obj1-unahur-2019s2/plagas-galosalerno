import Elementos.*


class Plagas {
	
	var property poblacion 
	
		method transmiteEnfermedades(){return poblacion >=10} 
		method nivelDeDanio(){return {}}
		method atacar(elemento){
			elemento.serAtacado(self) ; 
			poblacion+=poblacion%10
		}
}

class Cucarachas inherits Plagas {
	
	var property pesoPromedio
		
		method pesoPromedioMayor(){return self.pesoPromedio()>=10}
		override method nivelDeDanio(){return self.poblacion()/2}
		override method transmiteEnfermedades(){return super() and self.pesoPromedioMayor() }
		override method atacar(elemento){super(elemento) ; pesoPromedio+=2 }
}

class Pulga inherits Plagas {
	
	
		override method nivelDeDanio(){return self.poblacion()*2}
}

class Garrapata inherits Pulga {
	
		override method atacar(elemento){
			
			elemento.serAtacado(self) ;
			poblacion=poblacion*1.20 
			
		}
}
class Mosquitos inherits Plagas {
	
		
		override method transmiteEnfermedades(){return super() and poblacion%3==0 }
		override method nivelDeDanio(){return poblacion}
}


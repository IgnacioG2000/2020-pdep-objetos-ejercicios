import wollok.game.*
import movimientos.*
import carpinchos.*
import objetos.*

class Personaje{
	const property esAtravesable = true
	var property estaCongelado = false
	
	var orientacion = derecha
	
	method image() = orientacion.imagenDelJugador(self)
	
	method puedeMoverAl(unaOrientacion) {
		if(self.estaCongelado()){
  			return false
  		}else return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion(self)).all {unObj => unObj.esAtravesable()}
	}
	method cambiarPosicion(posicion){}
	
	method moverseA(direccion){ 
    	orientacion = direccion
    	
    
    if(self.puedeMoverAl(direccion)){ 
      self.cambiarPosicion(direccion.posicionEnEsaDireccion(self))
    } 
  }
  
  method imagenDerecha() = self.nombre() + " right.png"
  method imagenIzquierda() = self.nombre() + " left.png"
  
  method nombre() = ""
}

object carpincho inherits Personaje {
	var property position = game.center()
		
	const distanciaX = self.position().x() - yaguarete.position().x()
	const distanciaY = self.position().y() - yaguarete.position().y()
	
	override method nombre() = "carpincho"
	
	override method cambiarPosicion(posicion) {
		self.position(posicion)
	}
  
	method perdiste() = true
		
	method alejarseDeYaguarete(){
		if(distanciaX < 10 || distanciaY < 10){
			self.huirDeyaguarete()
		}
	}

	method huirDeyaguarete(){
		if(self.position().x() == yaguarete.position().x()){ 
			
		    if(yaguarete.position().y() > self.position().y()){
			 self.moverseA(abajo)} 
			
		       else{
			     self.moverseA(arriba)}
		  }else{
			
		      if(yaguarete.position().x() > self.position().x()){
			   self.moverseA(izquierda)
			   } 
			
		         else{
			      self.moverseA(derecha)
			      } 
	          }	
	}	
	
	method chocasteConYaguarete(){
		juegoCarpinchoGaucho.perderJuego()
	}
}

object yaguarete inherits Personaje  {
	var property position = game.at (1,1)
		
	override method nombre() = "yaguarete"
	
	override method cambiarPosicion(posicion) {
		self.position(posicion)
	}
	
	method perseguirCarpincho(){
		
     	if(self.position().x() == carpincho.position().x()){ 
			
		    if(carpincho.position().y() > self.position().y()){
			 self.moverseA(arriba)} 
			
		       else{
			     self.moverseA(abajo)}
		  }else{
			
		      if(carpincho.position().x() > self.position().x()){
			   self.moverseA(derecha)} 
			
		         else{
			      self.moverseA(izquierda)} 
	          }				
	}
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.perderJuego()	
	}
	
}




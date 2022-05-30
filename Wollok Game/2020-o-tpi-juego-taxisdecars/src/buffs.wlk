import objetos.*
import personajes.*
import wollok.game.*
import movimientos.*

class Hielo inherits ObjetoAleatorio{ 
    override method image() = "hielo.png"
	override method chocasteConCarpincho(){
		self.congelar(carpincho)
	}
	override method chocasteConYaguarete(){
		self.congelar(yaguarete)
	}
	
	method congelar(personaje){
	game.sound("viento.mp3").play()
	game.removeVisual(self)
	//personaje.congelar()
	personaje.estaCongelado(true)
	game.schedule(3000, {personaje.estaCongelado(false)})
	
	}
}

object hielo{
	method spawn(posicionSpawn){game.addVisual(new Hielo(posicion = posicionSpawn))}
}

class Manzana inherits ObjetoAleatorio{ 
    override method image() = "manzana.png"
	override method chocasteConCarpincho(){
		self.duplicarPuntos()
	}
	override method chocasteConYaguarete(){
		self.duplicarPuntos()
	}
	
	method duplicarPuntos(){
	game.sound("comerManzana.mp3").play()
	game.removeVisual(self)
	//spawner.multiplicar()
	spawner.multiplicador(2)
	game.schedule(5000, {spawner.multiplicador(1)})
	}
}

object manzana{
	method spawn(posicionSpawn){game.addVisual(new Manzana(posicion = posicionSpawn))}
}
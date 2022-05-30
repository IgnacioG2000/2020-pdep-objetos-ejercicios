import wollok.game.*
import objetos.*
import personajes.*
import buffs.*

object keyConfig{
	method jugador1(personaje){
		keyboard.w().onPressDo({personaje.moverseA(arriba)})
		keyboard.s().onPressDo({personaje.moverseA(abajo)})
		keyboard.a().onPressDo({personaje.moverseA(izquierda)})
		keyboard.d().onPressDo({personaje.moverseA(derecha)})
	}
	
	method jugador2(personaje){
		keyboard.up().onPressDo({personaje.moverseA(arriba)})
		keyboard.down().onPressDo({personaje.moverseA(abajo)})
		keyboard.left().onPressDo({personaje.moverseA(izquierda)})
		keyboard.right().onPressDo({personaje.moverseA(derecha)})
}

}

object aleatorio {
	var posicion = game.at(8, 8)

	method nuevaPosicion() {
		// calculo coordenadas aleatorias dentro la pantalla
		const x = 1.randomUpTo(game.width() -1)
		const y = 1.randomUpTo(game.height() -1)
		// cambio a nueva posicion
		return game.at(x, y)
	}
}

object spawner{	
	var property multiplicador = 1
	
	method estaOcupado(posicionObjeto){
		return posicionObjeto.allElements().size()>0
	}
	
	method spawn(objeto){
		
		var posicionObjeto = aleatorio.nuevaPosicion()
		if(self.estaOcupado(posicionObjeto)){self.spawn(objeto)}
		else{
			objeto.spawn(posicionObjeto)
		}
	
	}
	

	method spawnPorTiempo(){
		game.onTick(3000 / multiplicador, "spawn mate aleatoriamente", {self.spawn(mate)})
		game.onTick(15000 / multiplicador, "spawn mate de oro aleatoriamente", {self.spawn(mateDeOro)})
		game.onTick(30000 / multiplicador, "spawn alfajor aleatoriamente", {self.spawn(alfajor)})
		game.onTick(5000.randomUpTo(10000), "spawn hielo aleatoriamente", {self.spawn(hielo)})
		game.onTick(10000.randomUpTo(20000), "spawn manzana aleatoriamente", {self.spawn(manzana)})
	}
	
	method apagarSpawner(){
		game.removeTickEvent("spawn mate aleatoriamente")
		game.removeTickEvent("spawn mate de oro aleatoriamente")
		game.removeTickEvent("spawn alfajor aleatoriamente")
		game.removeTickEvent("spawn hielo aleatoriamente")
		game.removeTickEvent("spawn manzana aleatoriamente")
	}
}

object arriba {
  method posicionEnEsaDireccion(jugador) = jugador.position().up(1)
  method imagenDelJugador(jugador) = jugador.imagenDerecha()
}

object abajo {
  method posicionEnEsaDireccion(jugador) = jugador.position().down(1)
  method imagenDelJugador(jugador) = jugador.imagenDerecha()
}

object izquierda {
  method posicionEnEsaDireccion(jugador) = jugador.position().left(1)
  method imagenDelJugador(jugador) = jugador.imagenIzquierda()
  }

object derecha {
  method posicionEnEsaDireccion(jugador) = jugador.position().right(1)
  method imagenDelJugador(jugador) = jugador.imagenDerecha()
}
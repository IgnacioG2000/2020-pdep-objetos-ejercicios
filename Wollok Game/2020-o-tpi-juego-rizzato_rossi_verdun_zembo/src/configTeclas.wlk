import wollok.game.*
import niveles.*
import jugador.*
import enemigos.*

object config{
	method configColisiones(){
	game.onCollideDo(jugador, {algo => algo.chocarJugador()})
	}
	
	method teclasJugador(){
  	keyboard.up().onPressDo {jugador.mover(jugador.position().up(1),arriba) }
 	keyboard.down().onPressDo {jugador.mover(jugador.position().down(1),abajo) }
  	keyboard.left().onPressDo {jugador.mover(jugador.position().left(1),izquierda)}
  	keyboard.right().onPressDo {jugador.mover(jugador.position().right(1),derecha) }
  	
  	}

}

import jugador.*
import wollok.game.*

object energia{
	const property position = game.at(4,29)
	
	method image(){
		if(jugador.energiaJugador() <= 100 and jugador.energiaJugador() > 75){
			return "energiaEntera.png"
		}else if(jugador.energiaJugador() <= 75 and jugador.energiaJugador() >50){
			return "energia75.png"
		}else if(jugador.energiaJugador() <= 50 and jugador.energiaJugador() >25){
			return "energiaMitad.png"
		}else if(jugador.energiaJugador() <= 25 and jugador.energiaJugador() > 0){
			return "energia25.png"
		}else{
			return "energiaVacia.png"
		}
	} 
}

class Chori {
    var property position
    const energiaQueDa = 25

    method image() = "chori.png"
    method esAtravesable() = true

    method energiaQueDa() = energiaQueDa

    method chocarJugador(){
        game.removeVisual(self)
        game.say(jugador,"buenardino rivadavia")
        jugador.ganarEnergia(energiaQueDa)
    }
	
}
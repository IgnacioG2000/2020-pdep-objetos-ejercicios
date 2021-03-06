import config.*
import zombies.*
import tablero.*
import wollok.game.*

object niveles {
	var property nivel = 0
	const frecuenciaZombies = 3000
	
	
	method iniciarNuevaOleada() {
		nivel++
		
		var velocidadMovimiento = 6000
		var vidaZombie = 100
		const cantidadZombies = (4 * nivel + nivel / 2).truncate(0)
		
		nivel.times({ i => 
			velocidadMovimiento = (velocidadMovimiento - 1000 /i).truncate(0)
			vidaZombie = (vidaZombie + 100 / i).truncate(0)
		})
		
		game.onTick(
			  frecuenciaZombies
			, "Oleada"
			, {	const zombie = new Zombie (
			  		  position = game.at(0, 2.randomUpTo( game.height() ))
					, image = "zombie.png"
					, vida = vidaZombie
				)
				tablero.agregarZombie(zombie, velocidadMovimiento) }
		)
		game.schedule(cantidadZombies * frecuenciaZombies, { => game.removeTickEvent("Oleada") })
	}	
}

object puntaje {
	var property puntaje = 0
	const cifras = []
	
	method iniciarPuntaje() {
		self.crearCifra(0)
	}
	
	method sumar(puntos) {
		puntaje += puntos * niveles.nivel()
		
		var aux = puntaje
		cifras.forEach({ cifra => 
			cifra.actualizar(aux % 10)
			aux = aux.div(10)
		})
		
		if(aux > 0) self.crearCifra(aux)
	}
	
	method crearCifra(valorInicial) {
		const cifra = new Numero(
				  position = game.at(21 - cifras.size(), 1)
				, valor = valorInicial	 
		)
		cifras.add(cifra)
		game.addVisual(cifra)
	}
}

class Numero {
	var position
	var valor
	
	method image() = valor.toString() + ".png"
	method position() = position
	
	method actualizar(nuevoValor) {
		valor = nuevoValor
	}
	
}
import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import screens.*
import carpinchos.*

object modoCarpincho{
	method configurarTeclas(){
		keyConfig.jugador1(carpincho)
	}

method configurarAcciones(dificultad){
	spawner.spawnPorTiempo()
	game.onTick(dificultad.velocidad(), "mover yaguarete", {yaguarete.perseguirCarpincho()})                                                     
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}		


method terminarPartida(){
	puntos.mostrarPuntaje()
 }

}


object dosJugadores{
	
	method configurarTeclas(){
		keyConfig.jugador1(carpincho)
		keyConfig.jugador2(yaguarete)
	}

method configurarAcciones(dificultad){
	spawner.spawnPorTiempo()                                                    
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	game.onCollideDo(yaguarete,{visualColisionado=>visualColisionado.chocasteConYaguarete()})
	}

method terminarPartida(){
	puntos.mostrarPuntaje()
 } 

}


object modoCazar{
	method configurarTeclas(){
		keyConfig.jugador1(yaguarete)
	}

method configurarAcciones(dificultad){
	juegoCarpinchoGaucho.arbustosActivados(true)
	//screenFinal.imagen("yaguareteGanador.png")
	spawner.spawnPorTiempo()
	game.onTick(dificultad.velocidad(), "mover carpincho", {carpincho.alejarseDeYaguarete()})                                                     
	game.onCollideDo(yaguarete,{visualColisionado=>visualColisionado.chocasteConYaguarete()})
	}		

method terminarPartida(){
	game.addVisual(puntos)
	game.say(puntos, "¡Ganaste!")
 }
}

// DIFICULTADES

object normal{
	method velocidad() = 400
}

object dificil{
	method velocidad() = 200 
}

object experto{
	method velocidad() = 100
}

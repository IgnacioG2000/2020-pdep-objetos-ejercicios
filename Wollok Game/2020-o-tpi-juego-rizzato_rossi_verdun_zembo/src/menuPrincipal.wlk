import wollok.game.*
import niveles.*

object menu {
		
	method pantallaDeInicio(){
		
		game.title("escapar de lationoamerica: the game")
		game.width(30)
		game.height(30)
		game.ground("suelo.jpg")
		game.addVisual(imagenMenu)
		
		//COMENZAR JUEGO
		keyboard.c().onPressDo{nivel1.iniciar()}
		
		//SOLO TEST PARA IR DERECHO AL LVL 2
		keyboard.m().onPressDo{nivel2.iniciar()}
		
		keyboard.n().onPressDo{nivel3.iniciar()}
		
		//SALIR DEL JUEGO
		keyboard.f().onPressDo{game.stop()} //anda 
	}
	
}

object imagenMenu{
	
	method position() = game.at(0,0)
	
	method image() = "menuPrincipal.png"
	
}

object final{
	method position() = game.at(0,0)
	
	method image() = "goodEnding.png"
	
	
}
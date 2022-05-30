import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import modos.*
import carpinchos.*

object fondo{
	var property image = "fondocarpinchos2.png"
	var property position = game.at(0, 0)
	const property esAtravesable = true
	method chocasteConCarpincho(){}
	method chocasteConYaguarete(){}
}

class Boton{
	
	var property image
	var posicion
	var modo
	
	const property esAtravesable = true
	
	method position() = posicion
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.modo(modo)
		juegoCarpinchoGaucho.iniciar()
		game.sound("start.mp3").play()
	}	
}

const botonModoCarpincho = new Boton(
	image = "modo carpincho.png",
	posicion = game.at(12, 12),
	modo = modoCarpincho
)

const botonModoPvp = new Boton(
	image = "modo pvp.png",
	posicion = game.at(12, 8),
	modo = dosJugadores
)

const botonModoCazar = new Boton(
	image = "modo cazar.png",
	posicion = game.at(12, 4),
	modo = modoCazar
)

class SwitchArbustos{
	const arbActivados
	var property image
	var property position
	
	const property esAtravesable = true
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.arbustosActivados(arbActivados)
		game.sound("agarrarObjeto.mp3").play()
	}	
}

const switchArbustosSi = new SwitchArbustos(arbActivados = true, image = "switchArbustosSi.png", position = game.at(7, 1))
const switchArbustosNo = new SwitchArbustos(arbActivados = false, image = "switchArbustosNo.png", position = game.at(9,1))

class SwitchDificultad{
	const dificultad
	var property image
	var property position
	
	const property esAtravesable = true
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.dificultad(dificultad)
		game.sound("agarrarObjeto.mp3").play()
	}
		
}

const botonNormal = new SwitchDificultad(dificultad = normal, image = "dificultadNormal.png", position = game.at(2,12))

const botonDificil = new SwitchDificultad(dificultad = dificil, image = "dificultadDificil.png", position = game.at(2,8))

const botonExperto = new SwitchDificultad(dificultad = experto, image = "dificultadExperto.png", position = game.at(2,4)) 

object start{
	
	method iniciar() {
		self.agregarFondo()
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		self.generarMuros()
		self.agregarBotones()
		game.start()
		
	}
	
	method configurarJuego(){
	game.title("CarpinchoGaucho")
	game.width(20)
	game.height(20)
	game.cellSize(50)
	game.boardGround("fondocampo.png")
    }
    
    method agregarFondo(){
    	game.addVisual(fondo)
    }
	
	method configurarTeclas(){
		keyConfig.jugador1(carpincho)
	}
	
	method agregarPersonajes(){
	  	game.addVisual(carpincho)
	  	
    }
    
    method configurarAcciones(){
    	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
    }
    
    method agregarBotones(){
    	game.addVisual(botonModoCarpincho)
	  	game.addVisual(botonModoPvp)
	  	game.addVisual(botonModoCazar)
    	game.addVisual(switchArbustosSi)
    	game.addVisual(switchArbustosNo)
    	game.addVisual(botonNormal)
    	game.addVisual(botonDificil)
    	game.addVisual(botonExperto)
    }
    
  	method generarMuros() {
   		const ancho = game.width() - 1 
   		const alto = game.height() - 1 
   		const posicionesParaGenerarMuros = []
		
   		(0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(num, alto)))} // lado superior
   		(0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(num, 0)))} // lado inferior
   		(0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(ancho, num)))} // lado derecho
   		(0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(0, num)))} // lado izquierdo
    
   		posicionesParaGenerarMuros.forEach {posicion => game.addVisual(posicion)}
}

	method generarArbustos(){
		const posicionesParaGenerarArbustos = []
		
		(0 .. 12).forEach{ num => posicionesParaGenerarArbustos.add(new Arbusto(position = aleatorio.nuevaPosicion()))}
		
		posicionesParaGenerarArbustos.forEach {posicion => game.addVisual(posicion)}
	}
    
}

object screenFinal{
	method iniciar(){
		game.addVisual(fondo)
		fondo.image("perdiste.png")
	}
}

object puntos {
	var property puntaje = 0
	
	const property position = game.at(14,10)
	
	const property image = "puntos.png"	
	
	method mostrarPuntaje(){
		game.addVisual(self)
		game.say(self, "¡Perdiste! Tus puntos son: " + puntaje)
	}
	
	method suma(puntosObtenidos){
		puntaje = puntaje + puntosObtenidos
	}
}
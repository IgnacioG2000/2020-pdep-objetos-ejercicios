import wollok.game.*
import enemigos.*
import jugador.*
import menuPrincipal.*
import configTeclas.*
import avion.*
import pasaporte.*
import muros.*
import energia.*


class Nivel {
	var siguienteNivel
		
	method iniciar(){
		game.addVisual(corazon)
		game.addVisual(energia)
		jugador.setearNivel(self)
	}
}


object nivel1 inherits Nivel{
	const enemigo1 = new EnemigoVertical(
		limite = 4,
		position = game.at(3,17)
	)	
	const enemigo2 = new EnemigoVertical(
		limite = 4,
		position = game.at(7,7)
	)
	const enemigo3 = new EnemigoVertical(
		limite = 4,
		position = game.at(11,21)
	)
	const enemigo4 = new EnemigoHorizontal(
		limite = 8,
		position = game.at(12,4)
	)
	
	const enemigo5 = new EnemigoHorizontal(
		limite = 8,
		position = game.at(12,7)
	)
	
	const enemigo6 = new EnemigoHorizontal(
		limite = 8,
		position = game.at(12,10)
	)
	
	const enemigo7 = new EnemigoHorizontal(
		limite = 16,
		position = game.at(12,18)
	)
	
	const enemigo8 = new EnemigoHorizontal(
		limite = 6,
		position = game.at(22,4)
	)
	
	const pasaporte1 = new Pasaporte(position = game.at(16,2)
	)
	const avionLvl1 = new Avion(siguienteNivel = nivel2,
		position = game.at(25,3),
		pasaporteActual = pasaporte1
	)
	
	const chori1 = new Chori(position = game.at(20,5))
	const chori2 = new Chori(position = game.at(16,24))
	
	override method iniciar(){
		game.clear()
		muro.generarParedes()
		muroslvl1.generarParedes()
		super()
		game.addVisual(chori1)
		game.addVisual(chori2)
		game.addVisual(avionLvl1)
		game.addVisual(enemigo1)
		game.addVisual(enemigo2)
		game.addVisual(enemigo3)
		game.addVisual(enemigo4)
		game.addVisual(enemigo5)
		game.addVisual(enemigo6)
		game.addVisual(enemigo7)
		game.addVisual(enemigo8)
		game.addVisual(pasaporte1)
		game.addVisual(jugador)
		jugador.volverAInicio()
		game.onTick(1000,"moverse",{enemigo1.moverse()})
		game.onTick(1000,"moverse",{enemigo2.moverse()})
		game.onTick(1000,"moverse",{enemigo3.moverse()})
		game.onTick(300,"moverse",{enemigo4.moverse()})
		game.onTick(500,"moverse",{enemigo5.moverse()})
		game.onTick(700,"moverse",{enemigo6.moverse()})
		game.onTick(300,"moverse",{enemigo7.moverse()})
		game.onTick(300,"moverse",{enemigo8.moverse()})
		config.configColisiones()
		config.teclasJugador()
		
	}
	
}


object nivel2 inherits Nivel{
	
	const enemigo1 = new EnemigoHorizontal(
		limite = 15,
		position = game.at(9,28)
	)
	
	const enemigo2 = new EnemigoHorizontal(
		limite =15,
		position = game.at(9,27)
	)
	
	const enemigo3 = new EnemigoHorizontal(
		limite =6,
		position = game.at(1,26)
	)
	
	const  enemigo4 = new EnemigoHorizontal(
		limite =3,
		position = game.at(1,20)
	)
	
	const enemigo5 = new EnemigoHorizontal(
		limite =4,
		position = game.at(15,19)
	)
	
	const enemigo6 = new EnemigoHorizontal(
		limite =4,
		position = game.at(24,20)
	)
	
	const enemigo7 = new EnemigoHorizontal(
		limite =6,
		position = game.at(22,15)
	)
	
	const enemigo8 = new EnemigoHorizontal(
		limite =2,
		position = game.at(26,13)
	)
	
	const enemigo9 = new EnemigoHorizontal(
		limite =5,
		position = game.at(14,13)
	)
	
	const enemigo10 =new EnemigoHorizontal(
		limite =7,
		position = game.at(1,12)
	)
	
	const enemigo11 =new EnemigoHorizontal(
		limite =7,
		position = game.at(1,9)
	)
	
	const enemigo12 =new EnemigoHorizontal(
		limite = 6,
		position = game.at(3,6)
	)
	
	const enemigo13 =new EnemigoHorizontal(
		limite =3,
		position = game.at(12,8)
	)
	
	const enemigo14 =new EnemigoHorizontal(
		limite =3,
		position = game.at(21,5)
	)	
	
	const enemigo15 =new EnemigoHorizontal(
		limite =1,
		position = game.at(26,6)
	)
	
	const enemigo16 = new EnemigoVertical(
		limite =3,
		position = game.at(12,21)
	)
	
	const enemigo17 = new EnemigoVertical(
		limite = 2,
		position = game.at(24,25)
	)
	
	const enemigo18 = new EnemigoVertical(
		limite =4,
		position = game.at(23,19)
	)
	
	
	const enemigo19= new EnemigoVertical(
		limite =3,
		position = game.at(5,14)
	)
	
	
	const enemigo20 = new EnemigoVertical(
		limite =5,
		position = game.at(16,10)
	)
	
	const enemigo21 = new EnemigoVertical(
		limite =3,
		position = game.at(4,9)
	)
	
	const enemigo22 = new EnemigoVertical(
		limite =7,
		position = game.at(11,5)
	)
	
	const enemigo23 = new EnemigoVertical(
		limite =4,
		position = game.at(14,11)
	)
	
	const enemigo24 = new EnemigoVertical(
		limite =1,
		position = game.at(14,1)
	)
	
	const pasaporteLvl2 = new Pasaporte(position = game.at(8,11))
	
	const avionLvl2 = new Avion(siguienteNivel = nivel3,
		position = game.at(28,26),
		pasaporteActual = pasaporteLvl2
	)
	
	const chori1 = new Chori(position = game.at(28,4))
	const chori2 = new Chori(position = game.at(3,16))
	const chori3 = new Chori(position = game.at(27,11))
	
	override method iniciar(){
		game.clear()
		jugador.energiaJugador(100)
		muro.generarParedes()
		muroslvl2.generarParedes()
		super()
		game.addVisual(enemigo1)
		game.addVisual(enemigo2)
		game.addVisual(enemigo3)
		game.addVisual(enemigo4)
		game.addVisual(enemigo5)
		game.addVisual(enemigo6)
		game.addVisual(enemigo7)
		game.addVisual(enemigo8)
		game.addVisual(enemigo9)
		game.addVisual(enemigo10)
		game.addVisual(enemigo11)
		game.addVisual(enemigo12)
		game.addVisual(enemigo13)
		game.addVisual(enemigo14)
		game.addVisual(enemigo15)
		game.addVisual(enemigo16)
		game.addVisual(enemigo17)
		game.addVisual(enemigo18)
		game.addVisual(enemigo19)
		game.addVisual(enemigo20)
		game.addVisual(enemigo21)
		game.addVisual(enemigo22)
		game.addVisual(enemigo23)
		game.addVisual(enemigo24)
		game.addVisual(chori1)
		game.addVisual(chori2)
		game.addVisual(chori3)
		game.addVisual(avionLvl2)
		game.addVisual(pasaporteLvl2)
		game.addVisual(jugador)
		jugador.volverAInicio()
		game.onTick(1500,"moverse",{enemigo1.moverse()})
		game.onTick(1500,"moverse",{enemigo2.moverse()})
		game.onTick(1500,"moverse",{enemigo3.moverse()})
		game.onTick(1500,"moverse",{enemigo4.moverse()})
		game.onTick(1500,"moverse",{enemigo5.moverse()})
		game.onTick(1000,"moverse",{enemigo6.moverse()})
		game.onTick(1000,"moverse",{enemigo7.moverse()})
		game.onTick(1000,"moverse",{enemigo8.moverse()})
		game.onTick(1000,"moverse",{enemigo9.moverse()})
		game.onTick(1000,"moverse",{enemigo10.moverse()})
		game.onTick(1000,"moverse",{enemigo11.moverse()})
		game.onTick(1000,"moverse",{enemigo12.moverse()})
		game.onTick(800,"moverse",{enemigo13.moverse()})
		game.onTick(800,"moverse",{enemigo14.moverse()})
		game.onTick(900,"moverse",{enemigo15.moverse()})
		game.onTick(600,"moverse",{enemigo16.moverse()})
		game.onTick(600,"moverse",{enemigo17.moverse()})
		game.onTick(600,"moverse",{enemigo18.moverse()})
		game.onTick(700,"moverse",{enemigo19.moverse()})
		game.onTick(700,"moverse",{enemigo20.moverse()})
		game.onTick(1000,"moverse",{enemigo21.moverse()})
		game.onTick(1000,"moverse",{enemigo22.moverse()})
		game.onTick(1000,"moverse",{enemigo23.moverse()})
		game.onTick(1000,"moverse",{enemigo24.moverse()})	
		config.configColisiones()
		config.teclasJugador()
	}
	
}

object nivel3 inherits Nivel{
	
	const enemigo1 = new EnemigoVertical(
		limite = 8,
		position = game.at(7,2)
	)	
	const enemigo2 = new EnemigoVertical(
		limite = 8,
		position = game.at(25,7)
	)
	const enemigo3 = new EnemigoVertical(
		limite = 5,
		position = game.at(26,18)
	)
	const enemigo4 = new EnemigoVertical(
		limite = 4,
		position = game.at(24,19)
	)
	const enemigo5 = new EnemigoVertical(
		limite = 3,
		position = game.at(3,21)
	)
	const enemigo6 = new EnemigoHorizontal(
		limite = 8,
		position = game.at(6,1)
	)
	const enemigo7 = new EnemigoHorizontal(
		limite = 8,
		position = game.at(1,12)
	)
	const enemigo8 = new EnemigoHorizontal(
		limite = 8,
		position = game.at(4,13)
	)
	const enemigo9 = new EnemigoHorizontal(
		limite = 10,
		position = game.at(10,10)
	)
	const enemigo10 = new EnemigoHorizontal(
		limite = 4,
		position = game.at(23,20)
	)
	const enemigo11 = new EnemigoHorizontal(
		limite = 4,
		position = game.at(1,21)
	)
	const enemigo12 = new EnemigoHorizontal(
		limite = 4,
		position = game.at(1,10)
	)
	
    const pasaporte3 = new Pasaporte(
    position = game.at(7,15)
    )        
	const avion3 = new Avion(position = game.at(20,21),siguienteNivel = lvlFinal, pasaporteActual = pasaporte3)  
	const chori1 = new Chori(position = game.at(10,4))
	const chori2 = new Chori(position = game.at(20,16))
	const chori3 = new Chori(position = game.at(21,10))
	const chori4 = new Chori(position = game.at(7,16))
	const chori5 = new Chori(position = game.at(12,28))	
	
	override method iniciar(){
		game.clear()
		jugador.energiaJugador(100)
		jugador.volverAInicio()
		muro.generarParedes()
		muroslvl3.generarParedes()
		super()
		game.addVisual(jugador)
		game.addVisual(avion3)
		game.addVisual(enemigo1)
		game.addVisual(enemigo2)
		game.addVisual(enemigo3)
		game.addVisual(enemigo4)
		game.addVisual(enemigo5)
		game.addVisual(enemigo6)
		game.addVisual(enemigo7)
		game.addVisual(enemigo8)
		game.addVisual(enemigo9)
		game.addVisual(enemigo10)
		game.addVisual(enemigo11)
		game.addVisual(enemigo12)
		game.addVisual(pasaporte3)
		game.addVisual(chori1)
		game.addVisual(chori2)
		game.addVisual(chori3)
		game.addVisual(chori4)
		game.addVisual(chori5)
		game.onTick(600,"moverse",{enemigo1.moverse()})
		game.onTick(500,"moverse",{enemigo2.moverse()})
		game.onTick(1000,"moverse",{enemigo3.moverse()})
		game.onTick(300,"moverse",{enemigo4.moverse()})
		game.onTick(500,"moverse",{enemigo5.moverse()})
		game.onTick(450,"moverse",{enemigo6.moverse()})
		game.onTick(500,"moverse",{enemigo7.moverse()})
		game.onTick(800,"moverse",{enemigo8.moverse()})
		game.onTick(200,"moverse",{enemigo9.moverse()})
		game.onTick(500,"moverse",{enemigo10.moverse()})
		game.onTick(500,"moverse",{enemigo11.moverse()})
		game.onTick(1000,"moverse",{enemigo12.moverse()})
		config.configColisiones()
		config.teclasJugador()
		
	}
}

object lvlFinal inherits Nivel{
	
	override method iniciar(){
		game.clear()
		game.addVisual(final)
		game.schedule(3000,{game.stop()})
	}
	
}

object gameOver inherits Nivel{
    override method iniciar(){
        game.clear()
        game.addVisual(badEnding)
        game.sound("sadness.mp3").play()
        game.schedule(6000,{game.stop()})
    }
}

class Invitado {
	var personalidad
	var disfraz
	
	method esSexy() = personalidad.soySexy()
	
	method conformeConDisfraz() = disfraz.puntuacion() > 10
}

class Fiesta {
	var fecha
	var lugar
	const invitados = #{}
	
	method fecha() = fecha
}

class Disfraz {
	var nombre
	var fechaRealizacion
	var property personaQueLoUtiliza
	
	method nombreConCantidadParDeLetras() = nombre.size() % 2 == 0
	
	method 
}

class Gracioso {
	var nivelGracia
	
	method puntuacion(disfraz,fiesta) {
		if(disfraz.personaQueLoLleva().edad() > 50)
			return 3 * nivelGracia
		return nivelGracia
	}
}

class Tobara {
	var diaQueComproElDisfraz
	
	method puntuacion(disfraz,fiesta) {
		if((fiesta.fecha() - diaQueComproElDisfraz) >= 2)
			return 5
		return 3
	}
}

class Careta {
	var personaje
	
	method puntuacion(disfraz,fiesta) {
		return personaje.puntaje()
	}
}

class Sexy {
	
	method puntuacion(disfraz,fiesta) {
		if(disfraz.personaQueLoLleva().esSexy()) 
			return 15
		return 2	
	}
}

object mickyMouse {
	
	method puntaje() = 8
}

object osoCarolina {
	
	method puntaje() = 6
}

object alegre {
	
	method esSexy(persona) = true
}

object taciturna {
	
	method esSexy(persona) {
		return persona.edad() < 30
	}
}

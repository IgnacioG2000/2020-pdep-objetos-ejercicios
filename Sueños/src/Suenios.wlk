
class Persona {
	var cantidadHijos = 0
	const lugaresAViajar = []
	const carrerasRecibidas = []
	const carrerasAEstudiar = []
	const sueniosPendientes = []
	var property salarioMinimoRequerido = 0
	const trabajos = #{}
	var tipoPersona = realista
	var property felicidonios = 0
	const suenios = []
	
	method esFeliz() {
		return felicidonios > sueniosPendientes.sum({unSuenio => unSuenio.felicidonios()})
	}
	
	method esAmbiciosa() = self.sueniosAmbiciosos().size() > 3
	
	method sueniosAmbiciosos() {
		return suenios.filter({unSuenio => unSuenio.esAmbicioso()})
	}
	
	method agregarTrabajo(trabajo) {
		trabajos.add(trabajo)
	}
		
	method agregarHijos(cantidad) {
		cantidadHijos += cantidad
	}
	
	method tieneHijos() = cantidadHijos > 0
	
	method agregarViaje(lugar) {
		lugaresAViajar.add(lugar)
	}
	
	method estudia(carrera) {
		carrerasAEstudiar.contains(carrera)
	}
	
	method seRecibio(carrera) {
		carrerasRecibidas.contains(carrera)
	}
	
	method agregarCarreraRecibida(carrera) {
		carrerasRecibidas.add(carrera)
	}
	
	method agregarCarreraAEstudiar(carrera) {
		carrerasAEstudiar.add(carrera)
	}
}


class Suenio {
	var cumplido = false
	
	method cumplirSuenio(persona) {
		self.validar(persona)
		self.realizar(persona)
		self.cumplir()
	}
	
	method felicidonios() 
	
	method cumplir() {
		cumplido = true
	}
	
	method estaPendiente() = !cumplido
	
	method esAmbicioso() = self.felicidonios() > 100
}

class AdoptarHijo inherits Suenio {
	var hijosAAdoptar
	
	method validar(persona) {
		if(persona.tieneHijos()) {
			self.error("No puede adoptar ya que tiene hijos")
		}
	}
	
	method realizar(persona) {
		persona.agregarHijos(hijosAAdoptar)
		
	}
}

class Viajar inherits Suenio {
	var lugar
	
	method validar(persona) {}
	
	method realizar(persona) {
		persona.agregarViaje(lugar)
	}
}

class Recibirse inherits Suenio {
	var carrera
	
	method validar(persona) {
		if(persona.estudia(carrera)) {
			self.error("Ya está estudiando esa carrera")
		}
		
		if(persona.seRecibio(carrera)) {
			self.error("Ya se recibio de esa carrera")
		}
	}
	
	method realizar(persona) {
		persona.agregarCarreraRecibida(carrera)
	}
}

class Trabajar inherits Suenio {
	var salarioMaximo
	var trabajo
	
	method validar(persona) {
		if(persona.salarioMinimoRequerido() > salarioMaximo) {
			self.error("No quiere un trabajo donde se gane menos de " + salarioMaximo)
		}
	}
	
	method realizar(persona) {
		persona.agregarTrabajo(trabajo)
	}
}

class SuenioSimple inherits Suenio {
	var felicidonios
	
	override method felicidonios() = felicidonios
}

class SuenioCompuesto inherits Suenio {
	const suenios = []
	
	override method felicidonios() {
		return suenios.sum({unSuenio => unSuenio.felicidonios()})
	}
	
	 method validar(persona) {
		return suenios.forEach({unSuenio => unSuenio.validar(persona)})
	}
	
	method realizar(persona) {
		return suenios.forEach({unSuenio => unSuenio.realizar(persona)})
	}
}

object realista {
	
	method cumplir(suenios) {
		suenios.max({unSuenio => unSuenio.felicidonios()})
	}
	
}

object alocados {
	
	method cumplir(suenios) {
		suenios.anyone()
	}
}

object obsesivo {
	
	method cumplir(suenios) {
		suenios.first()
	}
}




class Persona {
	var property posicion
	const elementosCerca = []
	var property criterioPersona
	var property criterioComida
	const comidas = []
	
	method pedirAOtro(elemento,persona) {
		persona.responderPedido(elemento,self)
	}
	
	method responderPedido(elemento,receptor) {
		if(!self.tieneElementoCerca(elemento)) 
			self.error("No puede pasar ese elemento")
		else
			criterioPersona.pasarElemento(self,elemento,receptor)
	}
	
	method puedeComer(comida) {
		if(criterioComida.permiteComer(comida))
			self.comer(comida)
		else
			self.error("No puede comer esa comida")
	}
	
	method comer(comida) {
		comidas.add(comida)
	}
	
	method estaPipon() = comidas.any({unaComida => unaComida.esPesada()})
	
	method laEstaPasandoBien() {
		return self.comioAlgo() && self.cumpleCondicion()
	}
	
	method cumpleCondicion()
	
	method recibirElemento(elemento) {
		elementosCerca.add(elemento)
	}
	
	method entregarElemento(elemento) {
		elementosCerca.remove(elemento)
	}
	
	method tieneElementoCerca(elemento) {
		elementosCerca.contains(elemento)
	}
	
	method entregarTodosLosElementos() {
		elementosCerca.clear()
	}
	
	method recibirElementos(elementos) {
		elementosCerca.addAll(elementos)
	}
	
	method intercambiarPosicion(receptor) {
		const posAux = self.posicion()
		receptor.posicion(posAux)
		self.posicion(receptor.posicion())
	}
	
	method comioAlgo() = !comidas.isEmpty()
	
}

class CriterioPersona {
	
	method pasarElemento(emisor,elementoPedido,receptor) {
		self.enviar(emisor,self.elementoAEnviar(emisor,elementoPedido),receptor)
	}
	
	method elementoAEnviar(emisor,elementoPedido) = elementoPedido
	
	method enviar(emisor,elementoPedido,receptor) {
		receptor.recibirElemento(elementoPedido)
		emisor.entregarElemento(elementoPedido)
	}
}

object sordo inherits CriterioPersona {
	
	override method elementoAEnviar(emisor,elementoPedido) = emisor.elementosCerca().first()
}

object todosLosElementos inherits CriterioPersona {
	
	override method elementoAEnviar(emisor,elementoPedido) = emisor.elementosCerca()
	
	override method enviar(emisor,elementos,receptor) {
		receptor.recibirElementos(elementos)
		emisor.entregarTodosLosElementos(elementos)
	}
}

object cambiarPosicion inherits CriterioPersona {
	
	override method pasarElemento(emisor,elementoPedido,receptor) {
		emisor.intercambiarPosicion(receptor)
	}
}

object benditoElemento inherits CriterioPersona {}

class Comida {
	var property calorias
	var property esCarne = true
	
	method esPesada() = calorias > 500
}

object vegetariano {
	
	method permiteComer(comida) = !comida.esCarne()
}

object dietetico {
	
	method permiteComer(comida) = comida.calorias() < oms.maxRecomendado()
}


class Combinados {
	const combinacionCondiciones = []
	
	method permiteComer(comida) = combinacionCondiciones.all({unaCondicion => unaCondicion.permiteComer(comida)})
}

object oms {
	
	method maxRecomendado() = 500
}

object osky inherits Persona {
	
	override method cumpleCondicion() = true
}

object moni inherits Persona {
	
	override method cumpleCondicion() = posicion == 1
}

object facu inherits Persona {
	
	override method cumpleCondicion() = comidas.any({unaComida => unaComida.esCarne()})
}

object vero inherits Persona {
	
	override method cumpleCondicion() = comidas.size() <= 3
}
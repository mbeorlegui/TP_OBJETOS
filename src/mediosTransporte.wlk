class MedioTransporte {
	
	var tiempoPorKm
	
	method precioTraslado(cantidadKms){
		return cantidadKms * self.precioPorKm()
	}
	
	method precioPorKm()
	
	method duracion(cantidadKms) {
		return tiempoPorKm * cantidadKms
	}
	
	method tiempoPorKm() {
		return tiempoPorKm
	}
}

const unAvion = new Avion(tiempoPorKm = 0.1, turbinas = [new Turbina(impulso = 10), new Turbina(impulso = 10)])
//const auto = new MedioTransporte(tiempoPorKm = 1 , precioPorKm = 4)
const unMicro = new Micro(tiempoPorKm = 1.2)
const unTren = new Tren(tiempoPorKm = 0.5)
const unBarco = new Barco(tiempoPorKm = 0.8, probabilidadDeChocarConUnIceberg = 25)
const otroAvion = new Avion(tiempoPorKm = 0.001, turbinas = [new Turbina(impulso = 10000), new Turbina(impulso = 10000), new Turbina(impulso = 5000), new Turbina(impulso = 5000)])

class Avion inherits MedioTransporte {
	const turbinas = []
	
	override method precioPorKm() {
		return turbinas.sum { turbina => turbina.impulso() }
	}
}

class Micro inherits MedioTransporte {
	override method precioPorKm() {
		return 5000
	}
}

class Tren inherits MedioTransporte {
	override method precioPorKm() {
		return 2300 / 1.60934 // 1.60934 km = 1 milla
	}
}

class Barco inherits MedioTransporte {
	const probabilidadDeChocarConUnIceberg
	
	override method precioPorKm() {
		return 1000 * probabilidadDeChocarConUnIceberg
	}
}

class Turbina {
	const impulso
	
	method impulso() {
		return impulso
	}
}
import Localidad.*
import mediosTransporte.*

class Viaje {
	const property localidadOrigen
	const property localidadDestino
	const property medioDeTransporte
	
	method precio() {
		return localidadDestino.precio() + medioDeTransporte.precioTraslado(self.distancia())
	}
	
	method distancia() {
		return localidadOrigen.distanciaA(localidadDestino)
	}
	
}


const unViajeDePhari = new Viaje(localidadOrigen = goodAirs, localidadDestino = lastToninas, medioDeTransporte = unMicro)
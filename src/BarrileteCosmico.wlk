import Localidad.*
import mediosTransporte.*
import Viajes.*
import usuarios.*

object barrileteCosmico {
	const destinos = #{garlicSea, silverSea, lastToninas, goodAirs}
	const mediosTransporte =#{unAvion, unMicro, unTren, unBarco, otroAvion}
	
	method destinosMasImportantes(){
		return destinos.filter({unDestino => unDestino.esDestacado()})
	}
	
	method aplicarDescuentoALosDestinos(unDescuento){
		destinos.forEach({unDestino => unDestino.descontar(unDescuento)})
	}
	
	method cartaDeDestinos() {
		return destinos.map { unDestino => unDestino.nombre() }
	}
	
	method esExtrema(){
		return self.destinosMasImportantes().any({unDestino => unDestino.esPeligroso()})
	}
	
	method destinosPeligrosos(){
		return destinos.filter({unDestino => unDestino.esPeligroso()})
	}
	
	method armarViaje(unUsuario, unDestino){
		return new Viaje(localidadOrigen = unUsuario.localidadActual(), localidadDestino = unDestino, medioDeTransporte = unUsuario.elegirMedioDeTransporte(mediosTransporte, unDestino))
	}
}
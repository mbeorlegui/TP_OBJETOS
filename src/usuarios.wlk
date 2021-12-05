import Localidad.*
import Viajes.*
import Perfiles.*

class Usuario {
	
	var nombreUsuario
	var property dineroEnCuenta
	var localidadActual
	
	const property viajes
	const property usuariosSeguidos
	
	var property perfil

	method viajarA(unViaje){
		self.verificarSiPuedoRealizarElViaje(unViaje)
		viajes.add(unViaje)
		dineroEnCuenta -= unViaje.precio()
		localidadActual = unViaje.localidadDestino()
		
	}
	
	method verificarSiPuedoRealizarElViaje(unViaje) {
		if(!self.puedeRealizarElViaje(unViaje)){
			throw new Exception(message = "El usuario no puede realizar este viaje")
		}
	}

	method puedeRealizarElViaje(unViaje){
		return dineroEnCuenta > unViaje.precio()
	}	
	
	method kilometros(){
		return viajes.sum({unViaje => unViaje.distancia()})
	}
	
	method seguirUsuario(unUsuario){
		self.agregarUsuarioQueSeguir(unUsuario)
		unUsuario.agregarUsuarioQueSeguir(self)
	}
	
	method agregarUsuarioQueSeguir(unUsuario){
		usuariosSeguidos.add(unUsuario)
	}
	
	method localidadActual() {
		return localidadActual
	}
	
	method elegirMedioDeTransporte(mediosDeTransporte, destino) {
		return self.perfil().elegirMedioDeTransporte(mediosDeTransporte, destino, self)
	}
	
	method puedeViajarEn(medioDeTransporte, destino) {
		return dineroEnCuenta > medioDeTransporte.precioTraslado(destino.distanciaA(self.localidadActual()))
	}
}




const phari = new Usuario(nombreUsuario = "phari", dineroEnCuenta = 1500, localidadActual = goodAirs, viajes = [unViajeDePhari], usuariosSeguidos = #{}, perfil = grupoFamiliar)


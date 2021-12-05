object empresarial {
	method elegirMedioDeTransporte(mediosDeTransporte, destino, usuario) {
		// return mediosDeTransporte.min {medioDeTransporte => medioDeTransporte.duracion(destino.distanciaA(usuario.localidadActual()))}
		return mediosDeTransporte.min {medioDeTransporte => medioDeTransporte.tiempoPorKm()}
	}
}
object estudiantil {
	method elegirMedioDeTransporte(mediosDeTransporte, destino, usuario) {
		// return mediosDeTransporte.filter({medioDeTransporte => usuario.puedeViajarEn(medioDeTransporte, destino)}).min {medioDeTransporte => medioDeTransporte.duracion(destino.distanciaA(usuario.localidadActual()))}
		return mediosDeTransporte.filter({medioDeTransporte => usuario.puedeViajarEn(medioDeTransporte, destino)}).min {medioDeTransporte => medioDeTransporte.tiempoPorKm()}
	}
}

object grupoFamiliar {
	method elegirMedioDeTransporte(mediosDeTransporte, _destino, _usuario) {
		return mediosDeTransporte.anyOne()
	}
}

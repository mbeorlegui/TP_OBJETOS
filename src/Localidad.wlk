class Localidad {
	const nombre
	const property sugerenciasViaje 
	var property precio
	const property ubicacionKm
	
	method descontar(descuentoAAplicar){
		precio *= (1 - descuentoAAplicar / 100)
		sugerenciasViaje.add("certificado de descuento")
	}
	
	method esPeligroso(){
		return self.sugerenciasViaje().any({sugerencia => sugerencia.contains("vacuna")})
	}
	
	method esDestacado(){
		return self.precio() > 2000
	}
	
	method nombre() {
		return nombre
	}
	
	method distanciaA(unaLocalidad){
		return (self.ubicacionKm() - unaLocalidad.ubicacionKm()).abs()
	}
	
}

const garlicSea   = new Localidad(nombre = "Garlic´s Sea", sugerenciasViaje = ["caña de pescar" , "piloto"] , precio = 2500, ubicacionKm = 10)
const silverSea   = new Localidad(nombre = "Silver's Sea", sugerenciasViaje = ["protector solar" , "equipo de buceo"], precio = 1350, ubicacionKm = 240)
const lastToninas = new Localidad(nombre = "Last Toninas", sugerenciasViaje = ["vacuna gripal", "vacuna B", "Necronomicon"], precio = 3500, ubicacionKm = 360)
const goodAirs    = new Localidad(nombre = "Good Airs"   , sugerenciasViaje = ["cerveza", "protector solar"], precio = 1500, ubicacionKm = 1050)

/*
const marDelPlata = new Playa(nombre = "Mar Del Plata" , sugerenciasViaje = ["protector solar", "gorra", "vacuna Covid"], precio = 1000, ubicacionKm = 400 )

const aconcagua   = new Montania(nombre = "Aconcagua", sugerenciasViaje = ["pasamontañas", "campera nieve" , "zapatillas trekking", "vacuna covid"], precio = 1800, ubicacionKm = 1540, altura = 6962)
const sierraVentana = new Montania(nombre = "Sierra de la ventana", sugerenciasViaje = ["zapatillas trekking", "remera deportiva"], precio = 900, ubicacionKm = 900, altura = 150)

const buenosAires = new CiudadHistorica(nombre = "Buenos Aires", sugerenciasViaje = ["seguro asistencia al viajero", "GPS"], precio = 400 , ubicacionKm = 0, museos = #{"Museo de la ciudad", "Museo de bellas artes", "casa Rosada" , "Museo de los ninos"})
const nuevaYork = new CiudadHistorica(nombre = "Nueva York", sugerenciasViaje = ["dolares", "valija grande", "zapatillas comodas" ], precio = 3500 , ubicacionKm = 8400 , museos = #{"Empire State", "Estatua de la libertad", "moma" , "Museo de la ciudad de Nueva York"}) 
const china = new CiudadHistorica(nombre = "China", sugerenciasViaje = ["yuanes", "traductor", "plato para arroz"], precio = 3100 , ubicacionKm = 12300 , museos = #{"Muralla China", "Ciudad prohibida"}) 
*/
class Playa inherits Localidad {
	
	override method esPeligroso(){
		return false
	}
	
}

class Montania inherits Localidad {
	
	const altura
	
	override method esPeligroso(){
		return super() && altura > 5000
	} 
	
	override method esDestacado(){
		return true
	}
}

class CiudadHistorica inherits Localidad {
	
	const museos = #{}
	
	override method esDestacado(){
		return super() && self.tieneMuchosMuseos()
	}
	
	method tieneMuchosMuseos(){
		return museos.size() >= 3
	}
	
	override method esPeligroso(){
		return not self.sugerenciasViaje().any({sugerencia => sugerencia.contains("seguro asistencia al viajero")})
	}
	
}
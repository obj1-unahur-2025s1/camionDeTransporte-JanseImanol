object camion {
    const carga = []
    method pesoTotal() = 1000 + self.pesoCarga()

    method cargarCosa(unaCosa) {carga.add(unaCosa)}
    method descargarCosa(unaCosa) {carga.remove(unaCosa)}

    method pesoCarga() = carga.sum({c => c.peso()})
    method todoPesoPar() = carga.all({e => e.peso().even()})
    method hayAlgoQuePesa(unPeso) =  carga.any({e => e.peso() == unPeso})
    method cosaConPeligrosidad(unNivel) = carga.find({e => e.peligrosidad() == unNivel}) 
    method cosasConPeligrosidadMayor(unNivel) = carga.filter({c => c.peligrosidad() > unNivel}) 
    method cosasConMayorPeligrosidadQue(unaCosa) = self.cosasConPeligrosidadMayor(unaCosa)
    method estaExedido() = self.pesoTotal() > 2500
    method puedeCircular(unNivel) =  
        not self.estaExedido() and self.cosasConPeligrosidadMayor(unNivel).isEmpty() 
    method tieneAlgoQuePesaEntre(min,max) = carga.any({e => e.peso().between(min, max)}) 
    method cosaMasPesada() = carga.max({e => e.peso()}) 
}


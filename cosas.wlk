object knightRider {
    method getPeso() = 500
    method getPeligrosidad() = 10  
}

object bumblebee {
    var estaTransformado = false

    method peso() = 800

    method peligrosidad(){
        var lvPeligroso = 15
        
        if (estaTransformado){
            lvPeligroso = 30
        }
        return lvPeligroso
    }

    method transformarce() {
      estaTransformado = not estaTransformado
    }
}

object paqueteDeLadrillos {
    var property cantLadrillos = 0 // crea el geter y el setter auto cantLadrillos() y cantLadrillis(cant)

    method peso() = cantLadrillos * 2 
    method peligrosidad() = 2
}

object arenaGranel {
    var property peso = 0 
    method getPeligrosidad() = 1 
}

object bateriaAntiaeria {
    var tieneMisiles = false

    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0

    method cargarMisiles() {tieneMisiles = true}
    method descargarMisiles() {tieneMisiles = false}
}

object contenedorPortuario {
    const contenido = []

    method peso() = 100 + contenido.sum({c => c.peso()})
    method peligrosidad() = 
        if(contenido.isEmpty()) 0 else contenido.max({c => c.peligrosidad()}).peligrosidad()
    method agregarObjeto(cosa) {contenido.add(cosa)}
    method sacarAlgo(cosa) {contenido.remove(cosa)}
    method agregarListaDeCosas(unaLista) {contenido.addAll(unaLista)}  
    method vaciarContenedor() {contenido.clear()}

}

object residuosRadiactivos {
    var property peso = 0 
    method peligrosidad() = 200 
}

object embalajeDeSeguridad {
    var objetoEmbalado = null

    method embalarObjeto(algo) {objetoEmbalado = algo}

    method peligrosidad() = objetoEmbalado.peligrosidad() * 0.5
    method peso() = objetoEmbalado.peso()  
}
object knightRider {
    method getPeso() = 500
    method getPeligrosidad() = 10  
    method bulto() = 1 
    method consecuenciaDeCarga() {}
}

object bumblebee {
    var estaTransformado = false

    method peso() = 800
    method bulto() = 2 

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

    method consecuenciaDeCarga() {estaTransformado = true}
}

object paqueteDeLadrillos {
    var property cantLadrillos = 0 // crea el geter y el setter auto cantLadrillos() y cantLadrillis(cant)

    method peso() = cantLadrillos * 2 
    method peligrosidad() = 2

    method bulto() = if (cantLadrillos <= 100) 1
                     else if (cantLadrillos.between(101, 300)) 2
                     else 3

    method consecuenciaDeCarga() {cantLadrillos += 12}
}

object arenaGranel {
    var property peso = 0 
    method getPeligrosidad() = 1
    method bulto() = 1 
    method consecuenciaDeCarga() {peso = (peso - 10).max(0)}
}

object bateriaAntiaeria {
    var tieneMisiles = false

    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0

    method cargarMisiles() {tieneMisiles = true}
    method descargarMisiles() {tieneMisiles = false}

    method bulto() = if(tieneMisiles) 1 else 2

    method consecuenciaDeCarga() {self.cargarMisiles()}
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
    method bulto() = 1 + contenido.sum({c => c.bulto()})

    method consecuenciaDeCarga() {contenido.forEach({e => e.consecuenciaDeCarga()})}

}

object residuosRadiactivos {
    var property peso = 0 
    method peligrosidad() = 200 
    method bulto() = 1 
    method consecuenciaDeLaCarga() {peso += 15}
}

object embalajeDeSeguridad {
    var objetoEmbalado = null

    method embalarObjeto(algo) {objetoEmbalado = algo}
    method bulto() = 2 

    method peligrosidad() = objetoEmbalado.peligrosidad() * 0.5
    method peso() = objetoEmbalado.peso()  
    method consecuenciaDeCarga() {}
}
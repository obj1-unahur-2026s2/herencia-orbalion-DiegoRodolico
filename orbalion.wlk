class Equipo{
    const nombre
    const energia
    const entrenador
    var tecnologias = []

    method agregarTecnologia(tecnologia){tecnologias.add(tecnologia)}
    method energiaTotal(){
        return energia + tecnologias.sum({t=>t.valorEnergetico()})
    }
    method esDePrestigioUniversal()
}
class Luminico inherits Equipo{
    const radiacion
    const cristales = [] //strings

    override method energiaTotal(){
        if (radiacion < 5000)
            return super() * 1.10
        else return super()
    }
    override method esDePrestigioUniversal(){
        return cristales.size() >= 3 and entrenador.esEliteGalactica() and tecnologias.any({t=>t.estaActiva()})
    }
}
class Sintetico inherits Equipo{
    const procesamiento
    const modulos
    const estaCertificado

    override method energiaTotal(){
        if (modulos > 5)
            return super() * 0.80
        else return super()
    }
    override method esDePrestigioUniversal(){
        return estaCertificado and modulos > 3 and tecnologias.all({t=>t.estaActiva()})
    }
}
class Eterico inherits Equipo{
    const fluctuacion
    const portales

    method listaTecnologiasConUnaActiva(){
        return tecnologias.filter({t=>t.estaActiva()})
    }
    override method esDePrestigioUniversal(){
        return fluctuacion > 75 and portales > 2 and self.listaTecnologiasConUnaActiva().size() >= 2
    }
    override method energiaTotal(){
        if (self.esDePrestigioUniversal()) return super() * 1.15 else return super()
    }

}
class Entrenador{
    const ciclos
    const estaEnSintonia
    const precision
    const rol 

    method precision() = precision
    method estaEnSintonia() = estaEnSintonia
    method initialize(){
        if (not rol.estaHomologado())
            throw new Exception(message = "Rol no homologado por la FOZ")
    }
    method esEliteGalactica(){
        return ciclos > 10 and rol.condicionExtra(self)
    }

    method rol() = rol
}
object estrategaCuantico {
    method estaHomologado() = true
    method condicionExtra(entrenador) = entrenador.precision() > 80
}
object arquitectoDeEnergia {
    method estaHomologado() = true
    method condicionExtra(entrenador) = entrenador.estaEnSintonia()
}
object guiaMental {
    method estaHomologado() = true
    method condicionExtra(entrenador) = true
}
object rolNofuncional {
    method estaHomologado() = false
}

class Tecnologia{
    const nombre
    const valorEnergetico
    const estaActiva

    method nombre() = nombre
    method valorEnergetico() = valorEnergetico
    method estaActiva() = estaActiva
}
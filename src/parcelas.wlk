import plantas.*

class Parcelas 
{
	
	var property ancho = 0
	var property largo = 0
	var property plantas = {}
	var property horasDeSol = 0
	
	
	method superficie()
	{
		return ancho * largo
	}
	
	method cantidadMaxima()
	{
		return if (ancho > largo)
		{
			self.superficie() / 5
		}
		else
		{
			(self.superficie() / 3) + largo
		}
	}
	
	method tieneSangreJoven()
    {
        return plantas.any({plantita => plantita.anioDeObtencion() > 2012})
    }
	
	method plantar(planta)
	{
        if (self.cantidadDePlantas() == self.cantidadMaxima() or 
            (self.horasDeSol() - planta.horasDeSol()>2))
            {
                self.error("No puede plantarse")
            }
        else
         {
			plantas.add(planta)
         }
    }
	
	method seAsociaBien(planta)
	
	method cantidadDePlantas()
	  {
	  	return plantas.size()
	  }
	  
	method cantidadDeBienAsociadas()
    {
        return plantas.count({planta => self.seAsociaBien(planta)})
    }

    method porcentajeDeBienAsociadas()
    {
        return self.cantidadDeBienAsociadas() * 100 / self.cantidadDePlantas()
    }
}

class Ecologica inherits Parcelas
{
    override method seAsociaBien(planta)
    {
        return self.tieneSangreJoven() and planta.esParcelaIdeal(self)
    }
}

class Industrial inherits Parcelas
{
    override method seAsociaBien(planta)
    {
        return plantas.size() <= 2 and planta.esFuerte()
    }
}


object inta {

    const property parcelas = #{}

    method promedioDePlantas(){
        return parcelas.sum({p=>p.cantidadDePlantas()}) / self.cantidadDeParcelas()
    }

    method cantidadDeParcelas(){
        return parcelas.size()
    }

    method masAutosustentable(){
        return parcelas.any({p=>p.tieneMasDe(4)}) and self.mejorAsociada()
    }


    method mejorAsociada(){
        return parcelas.max({p=>p.porcentajeDeBienAsociadas()})
    }
}



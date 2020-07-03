import parcelas.*

class Plantas {
	
	var property altura = 0
	var property anioDeObtencion = 0
	
	
	method esFuerte()
	{
		return self.horasDeSolToleradas() > 9
	}
	
	method daSemillas()
	{
		return self.esFuerte()
	}
	
	method horasDeSolToleradas()
	{
		return 7
	}
	
	method espacioQueOcupa()
	
	method esParcelaIdeal(parcela)
	
}


class Menta inherits Plantas {

	 override method daSemillas()
    {
        return super() or self.altura() > 0.4
    }
	
	override method espacioQueOcupa()
	{
		return self.altura() + 1
	}
	
	override method esParcelaIdeal(parcela)
	{
		return parcela.superficie() > 6
	}
}



class Soja inherits Plantas {
	
	override method daSemillas() 
	{
		return super() or self.anioDeObtencion() > 2007 and self.altura().between(0.75, 0.9) 
	}
	
	override method espacioQueOcupa()
	{
		return self.altura() / 2
	}
	
	override method horasDeSolToleradas()
	{
		return if (self.altura() < 0.5)
		{
			 6
		}
		else if (self.altura().between(0.5,1))
		{
			 8
		}
		else
		{
			 12
		}
	}
	
	override method esParcelaIdeal(parcela)
	{
		return self.horasDeSolToleradas() == parcela.horasDeSol()
	}
}

class Quinoa inherits Plantas{
	const property espacioQueOcupa = 0
	
	override method daSemillas() 
	{
		return super() or self.anioDeObtencion() < 2005 
	}
	
	override method horasDeSolToleradas()
	{
		return if (self.altura() < 0.3)
		{
			10
		}
		else
		{
			self.altura()
		}
	}
	
	override method esParcelaIdeal(parcela)
    {
        return parcela.plantas().any({par => par.altura() <= 1.5})
    }
}

class SojaTrans inherits Plantas {
	
	override method daSemillas()
    {
        return false
    }
    
    override method esParcelaIdeal(parcela)
    {
        return parcela.cantidadMaxima() == 1
    }
}

class Peperina inherits Menta {
	
	override method espacioQueOcupa()
	{
		return super() * 2
	}
	
}




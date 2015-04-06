component
output="false"
hint="clase para el manejo de vectores de 2 ejes."
{
	/**
	* @hint constructor de la clase
	* @x valor del eje X del vector
	* @y valor del eje Y del vector
	*/
	public vector2 function init(
		numeric x = 0,
		numeric y = 0
	) {
		this['x'] = x;
		this['y'] = y;

		return this;
	}
}

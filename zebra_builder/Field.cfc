component
extend = "Cmd"
output = "false"
hint = "clase abstracta para los campos con cordenadas"
{
	/**
	 * @hint constructor de la clase
	 *	@DPM define el valor de los puntos por MM
	 *	@carret inicio de comandos imprimirbles
	 *	@delimiter delimitador de los argumentos del comando
	 *	@indent_lvl nivel de identacion del comando cuando se convierte a string
	 *	@tilde inicio de comandos de configuracion o no imprimibles	es el numero de tabs que agrega antes del comando
	 * @cmd comando de zpl del objeto
	 * @is_command define si el comando usa tilde y no carret
	 * @is_metric define si el comando usa el sistema metrico
	 * @x valor del eje X
	 * @y valor del eje Y
	*/
	public Field function init(
		numeric x = 0,
		numeric y = 0,
		string cmd = '',
		string carret = '^',
		string delimiter = ',',
		string tilde = '~',
		numeric DPM = 8,
		boolean is_metric = true,
		boolean is_command = false,
		numeric indent_lvl = 0
	) {
		var position = CreateObject( "component", "snippet.Vector2" ).init( x, y );
		return this.init( position, cmd, carret, delimiter, tilde, DPM, is_metric,
			is_command, indent_lvl );
	}

	/**
	 * @hint constructor de la clase
	 *	@DPM define el valor de los puntos por MM
	 *	@carret inicio de comandos imprimirbles
	 *	@delimiter delimitador de los argumentos del comando
	 *	@indent_lvl nivel de identacion del comando cuando se convierte a string
	 *	@tilde inicio de comandos de configuracion o no imprimibles	es el numero de tabs que agrega antes del comando
	 * @cmd comando de zpl del objeto
	 * @is_command define si el comando usa tilde y no carret
	 * @is_metric define si el comando usa el sistema metrico
	 * @position vector de posision del campo
	*/
	public Field function(
		snippet.Vector2 position,
		string cmd = '',
		string carret = '^',
		string delimiter = ',',
		string tilde = '~',
		numeric DPM = 8,
		boolean is_metric = true,
		boolean is_command = false,
		numeric indent_lvl = 0
	) {
		// TODO: ver la posibilidad de usar un transform
		if ( isDefined( position ) )
			this[ 'position' ] = position;
		else
			this[ 'position' ] = CreateObject( "component", "snippet.Vector2" )
				.init( x, y );
		SUPER.init( cmd, carrent, delimiter, tilde, DPM, is_metric, is_command, indent_lvl );
	}
}

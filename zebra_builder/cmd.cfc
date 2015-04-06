component
output = "false"
hint = "clase abstracta para los comandos de zebra"
{
	/**
	 * @hint constructor de la clase
	 *	@DPM define el valor de los puntos por MM
	 *	@carret inicio de comandos imprimirbles
	 *	@delimiter delimitador de los argumentos del comando
	 *	@indent_lvl nivel de identacion del comando cuando se convierte a string
	 *	@tilde inicio de comandos de configuracion o no imprimibles	es el numero de tabs que agrega antes del comando
	 * @cmd comando de zpl del objeto
	 * @is_metric define si el comando usa el sistema metrico
	 * @is_command define si el comando usa tilde y no carret
	*/
	public cmd function init(
		string cmd = '',
		string carret = '^',
		string delimiter = ',',
		string tilde = '~',
		numeric DPM = 8,
		boolean is_metric = true,
		boolean is_command = false,
		numeric indent_lvl = 0
	) {
		this[ "carret" ] = carret;
		this[ "delimiter" ] = delimiter;
		this[ "tilde" ] = tilde;
		this[ "indent_lvl" ] = indent_lvl;
		this[ "DPM" ] = DPM;
		this[ "cmd" ] = cmd;
		this[ "is_metric" ]= is_metric;
		this[ "is_command" ]= is_command;

		return this;
	}

	/**
	 * @hint convierte el comando a string
	 * @args_extra son los argumentos del comando zpl que se concatenaran en orden
	 * @pretty define si se concatenara la indentacion y se agrega un fin de linea al final
	*/
	public string function str( boolean pretty = false) {
		var args = "";
		if ( ArrayLen( arguments ) > 1 ) {
			args = arraySlice( arguments, 2 );
			args = ArrayToList( args, this.delimiter );
		}
		var indent = '';
		if ( pretty && this.indent_lvl > 0 ) {
			indent = arrayNew(1);
			ArraySet( indent, 1, this.indent_lvl, '\t' );
			indent = ArrayToList( indent, '' );
		}
		return indent & ( this.is_command ? this.tilde : this.carret )
			& this.cmd & args & (pretty ? '\n' : '');
	}
	
}

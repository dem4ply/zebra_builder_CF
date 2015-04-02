component
output="false"
hint="define la configuracion de la applicacion."
{
	// define la configuracion de la aplicacion.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 5, 0 );

	/*
		la applicaion no ocupa sessiones
	*/
	this.sessionManagement = false;

	/*
		optener el directorio absoluto de la applicacion
	*/
	this.directory = getDirectoryFromPath( getCurrentTemplatePath() );

	// define la ubicacion del zebra_builder
	var zebra_builder = (this.directory & "zebra_builder/");

	// se agrega al mapa de la apliacion zebra_builder
	this.mappings[ "/zebra_builder" ] = zebra_builder;

}

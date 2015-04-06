component
output="false"
hint="define la configuracion de la applicacion."
{
	// define la configuracion de la aplicacion.
	this.name = hash( getCurrentTemplatePath() );
	// ningun proseso de la aplicacion de zpl debe de durar mas e un segundo
	this.applicationTimeout = createTimeSpan( 0, 0, 0, 1 );

	// la applicaion no ocupa sessiones
	this.sessionManagement = false;

	// optener el directorio absoluto de la applicacion
	var directory = getDirectoryFromPath( getCurrentTemplatePath() );

	// define la ubicacion del zebra_builder
	var zebra_builder = (directory & "zebra_builder/");

	// se agrega al mapa de la apliacion zebra_builder
	this.mappings[ "/zebra_builder" ] = zebra_builder;

}

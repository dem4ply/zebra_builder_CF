component
output="false"
hint="define la configuracion de las prubas unitarias."
{
	//Define the application settings.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 5, 0 );

	// las unit test no requieren de sesicones
	this.sessionManagement = false;

	// optener el directorio absoluto de la applicacion
	this.directory = getDirectoryFromPath( getCurrentTemplatePath() );

	// mapeado de los directorios
	// directorio del framework de pruebas unitarias
	this.mappings[ "/mxunit" ] = this.directory & "../mxunit/";
	// directorio de las pruebas unitarias
	this.mappings[ "/spec" ] = this.directory & "spec/";
	// direcion del builder de zebra
	this.mappings[ "/zebra_builder" ] = this.directory & "../zebra_builder/";
}

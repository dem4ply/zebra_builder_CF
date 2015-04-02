component
output="false"
hint="define la configuracion de la applicacion."
{
	//Define the application settings.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 5, 0 );

	/*
		I am explicitly turning off session management for the MXUnit
		testing since I don't believe I want this level of testing
		for my "units." Sessions are managed in the Controller, not
		in my Model.
	*/
	this.sessionManagement = false;

	/*
		Get the tests directory - we'll be setting up mappings for
		directories relative to our testing directory.
	*/
	this.directory = getDirectoryFromPath( getCurrentTemplatePath() );

	this.zebra_builder = (this.directory & "../model/");

	/*
		Get our MXUnit directory - we'll need this in order to run
		the test suties from our tests directory.
	*/
	this.mxunitDirectory = (this.directory & "../mxunit/");

	/*
		Get the application-root directory (where our non-MXUnit,
		application code exists).
	*/
	this.appDirectory = (this.directory & "../../");

	/*
		***** MX UNIT FRAMEWORK *****
		Set up a mapping to the MXUnit framework; this is requied for
		the framework installation to run without a global mapping.
	*/
	this.mappings[ "/mxunit" ] = this.mxunitDirectory;

	/*
		***** TEST SPECIFICATIONS *****
		Map the spec folder so that our local tests can be located
		from within the MXUnit framework components.
	*/
	this.mappings[ "/spec" ] = (this.directory & "spec/");

	/*
		***** APPLICATION COMPONENTS *****
		Map the Model directory so we can include our application's
		components for unit testing.
	*/
	this.mappings[ "/zebra_builder" ] = this.zebra_builder;

	writedump(var = this, label = "ZPL - Application");
}

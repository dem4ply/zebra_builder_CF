component
output = "false"
hint = "test para la clase Field"
extends = "mxunit.framework.TestCase"
{
	/*
	 * @hint prueba del constructor de la clase con defaults
	*/
	public any function init_default_test() {
		var field = CreateObject( "component", "zebra_builder.Field" );
		field.init();
	}
}

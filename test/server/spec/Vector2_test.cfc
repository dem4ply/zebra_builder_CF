component
output = "false"
hint = "test para la clase Vector2"
extends = "mxunit.framework.TestCase"
{
	/*
	 * @hint prueba del constructor de la clase con defaults
	*/
	public any function init_default_test() {
		var vector = CreateObject( "component", "snippet.Vector2" );
		vector.init();
		assertEquals( 0, vector.x, "eje X deberia ser 0" );
		assertEquals( 0, vector.y, "eje Y deberia ser 0" );
	}

	/*
	 * @hint prueba del constructor de la clase sin defaults
	*/
	public any function init_not_default_test() {
		var vector = CreateObject( "component", "snippet.Vector2" );
		vector.init( 1, 2 );
		assertEquals( 1, vector.x, "eje X deberia ser 1" );
		assertEquals( 2, vector.y, "eje Y deberia ser 2" );
	}
}

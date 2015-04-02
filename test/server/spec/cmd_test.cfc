component
output = "false"
hint = "test para la clase abstracta de cmd"
extends = "mxunit.framework.TestCase"
{

	/*
	 * @hint prueba del constructor de la clase con defaults
	*/
	public any function init_default_test() {
		var cmd = CreateObject( "component", "zebra_builder.cmd" );
		cmd.init();
		assertEquals( "",    cmd.cmd,        "comando por default" );
		assertEquals( "^",   cmd.carret,     "carret por default" );
		assertEquals( ",",   cmd.delimiter,  "delimiter por default" );
		assertEquals( "~",   cmd.tilde,      "tilde por default" );
		assertEquals( 8,     cmd.DPM,        "DPM por default" );
		assertEquals( true,  cmd.is_metric,  "es metrico por default" );
		assertEquals( false, cmd.is_command, "es un comamndo no imprimible" );
		assertEquals( 0,     cmd.indent_lvl, "indent level por default" );
	}

	/*
	 * @hint prueba del constructor de la clase sin defaults
	*/
	public any function init_not_default_test() {
		var cmd = CreateObject( "component", "zebra_builder.cmd" );
		cmd.init(cmd = "cmd", carret = "[", delimiter = ";", tilde = "]",
			DPM = 16, is_metric = false, is_command = true, indent_lvl = 5);

		assertEquals( "cmd", cmd.cmd,         "comando por default" );
		assertEquals( "[",   cmd.carret,      "carret por default" );
		assertEquals( ";",   cmd.delimiter,   "delimiter por default" );
		assertEquals( "]",   cmd.tilde,       "tilde por default" );
		assertEquals( 16,    cmd.DPM,         "DPM por default" );
		assertEquals( false, cmd.is_metric,   "es metrico por default" );
		assertEquals( true,  cmd.is_command,  "es un comamndo no imprimible" );
		assertEquals( 5,     cmd.indent_lvl,  "indent level por default" );
	}

	/*
	 * @hint prueba de la conversion del comando a cadena
	*/
	public any function to_string() {
		var cmd = CreateObject( "component", "zebra_builder.cmd" );
		cmd.init();

		var str = cmd.str();
		assertEquals( "^", str, "comando por default, vacio y no pretty" );
		str = cmd.str(true);
		assertEquals( "^\n", str, "comando por default, vacio y pretty" );
		str = cmd.str(false, "1", "arg2");
		assertEquals( "^1,arg2", str, "comando por default con 2 argumentos y no pretty" );
		str = cmd.str(true, "1", "arg2");
		assertEquals( "^1,arg2\n", str, "comando por default con 2 argumentos y pretty" );

		cmd.init(is_command = true);

		str = cmd.str();
		assertEquals( "~", str, "comando por default, vacio y no pretty" );
		str = cmd.str(true);
		assertEquals( "~\n", str, "comando por default, vacio y pretty" );
		str = cmd.str(false, "1", "arg2");
		assertEquals( "~1,arg2", str, "comando por default con 2 argumentos y no pretty" );
		str = cmd.str(true, "1", "arg2");
		assertEquals( "~1,arg2\n", str, "comando por default con 2 argumentos y pretty" );

		cmd.init(cmd = "cmd", carret = "[", delimiter = ";", tilde = "]",
			DPM = 16, is_metric = false, is_command = false, indent_lvl = 5);

		str = cmd.str();
		assertEquals( "[cmd", str, "comando por no default, vacio y no pretty" );
		str = cmd.str(true);
		assertEquals( "\t\t\t\t\t[cmd\n", str, "comando por no default, vacio y pretty" );
		str = cmd.str(false, "1", "arg2");
		assertEquals( "[cmd1;arg2", str, "comando por no default con 2 argumentos y no pretty" );
		str = cmd.str(true, "1", "arg2");
		assertEquals( "\t\t\t\t\t[cmd1;arg2\n", str, "comando por no default con 2 argumentos y pretty" );

		cmd.init(cmd = "cmd", carret = "[", delimiter = ";", tilde = "]",
			DPM = 16, is_metric = false, is_command = true, indent_lvl = 5);

		str = cmd.str();
		assertEquals( "]cmd", str, "comando no imprimible por no default, vacio y no pretty" );
		str = cmd.str(true);
		assertEquals( "\t\t\t\t\t]cmd\n", str, "comando no imprimible por no default, vacio y pretty" );
		str = cmd.str(false, "1", "arg2");
		assertEquals( "]cmd1;arg2", str, "comando no imprimible por no default con 2 argumentos y no pretty" );
		str = cmd.str(true, "1", "arg2");
		assertEquals( "\t\t\t\t\t]cmd1;arg2\n", str, "comando no imprimible por no default con 2 argumentos y pretty" );
	}

}

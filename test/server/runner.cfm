<cfset testSuite = createObject( "component", "mxunit.framework.TestSuite" ).TestSuite() />
 
<!--- agrega las pruebas de la clase cmd --->
<cfset testSuite.addAll( "spec.cmd_test" ) />
 
<!---
    Run the tests that have been added. This will include all the
    methods of the all the components that we added above (in this
    case, it will be the encode() and decode() methods of the
    RomanNumeralEncoderTest.cfc).
--->
<cfset results = testSuite.run() />
 
<!---
    Output the results. Pass in the web-root of the MXUnit
    folder so that the rendering can properly set up the CSS
    and JavaScript URLs.
--->

<cfoutput>
    #results.getHtmlResults( "../mxunit/" )#
</cfoutput>

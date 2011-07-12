<?xml version='1.0' encoding='UTF-8'?>
<?xml-stylesheet type='text/css' href='../../../Applications/oxygen/frameworks/xproc/css/xproc.css'?>
<p:declare-step
	xmlns:local	=	"#empty" 
    xmlns:p		=	"http://www.w3.org/ns/xproc"
	xmlns:c		=	"http://www.w3.org/ns/xproc-step"
	
	xmlns:cx	=	"http://xmlcalabash.com/ns/extensions"
	xmlns:cxf	=	"http://xmlcalabash.com/ns/extensions/fileutils"
	
	xmlns:pos	=	"http://exproc.org/proposed/steps/os"
	xmlns:pxf	=	"http://exproc.org/proposed/steps/file"
	xmlns:pxfn	=	"http://exproc.org/proposed/functions"
	xmlns:pxp	=	"http://exproc.org/proposed/steps"
	
	xmlns:db	=	"http://docbook.org/ns/docbook"
	xmlns:xhtml	=	"http://www.w3.org/1999/xhtml"
	
	xpath-version=	"2.0"
	version		=	"1.0"
	
	name		=	"untitled"
>
	
	
	
	<!--	
		I/O
	-->
	<p:input	port="source">
		<p:document href="docbook/docbook.xml" />
	</p:input>
	
	<p:output
		port	=	"result"
		primary	=	"true"
		sequence=	"true" 
	/>
	<p:output
		port	=	"xhtml5"
		primary	=	"false"
		sequence=	"true" 
	/>
	
	
	<p:serialization
		port			="result" 
		encoding		="UTF-8"
		indent			="true"
		method			="xml"
		omit-xml-declaration="false"
		version			="1.0" 
	/>
	<p:serialization
		port			="xhtml5"
		doctype-system	="about:legacy-compat"
		encoding		="UTF-8"
		indent			="true"
		media-type		="application/xhtml+xml"
		method			="xml"
		omit-xml-declaration="false"
		version			="1.0" 
	/>
	
	
	<!--	
		Imports
	-->
	<p:import	href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"	/>
	<p:import	href="http://xmlcalabash.com/extension/steps/fileutils.xpl"		/>


	<!--
		PIPELINE BODY
	-->
	<p:group name="body">
		<p:xinclude	/>
	
		<p:delete 
			match="	processing-instruction('oxygen') | 
					processing-instruction('xml-stylesheet') |
					db:*[ except root() ]/@version
					" 
		/>
		
		<p:store 
			name				="store-result"
			
			encoding			="UTF-8" 
			href				="build/xproc-output.xml" 
			indent				="true" 
			omit-xml-declaration="false" 
		/>
		
		<p:identity>
			<p:input port="source">
				<p:pipe port="result" step="store-result" />
			</p:input>
		</p:identity>
		
	</p:group>
</p:declare-step>
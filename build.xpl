<?xml version='1.0' encoding='UTF-8'?>
<?xml-stylesheet
				type='text/css' 
				href='../../../Applications/oxygen/frameworks/xproc/css/xproc.css'
?>
<p:declare-step
	xmlns:local	=	'#empty' 
    xmlns:p		=	'http://www.w3.org/ns/xproc'
	xmlns:c		=	'http://www.w3.org/ns/xproc-step'
	
	xmlns:cx	=	'http://xmlcalabash.com/ns/extensions'
	xmlns:cxf	=	'http://xmlcalabash.com/ns/extensions/fileutils'
	
	xmlns:pos	=	'http://exproc.org/proposed/steps/os'
	xmlns:pxf	=	'http://exproc.org/proposed/steps/file'
	xmlns:pxfn	=	'http://exproc.org/proposed/functions'
	xmlns:pxp	=	'http://exproc.org/proposed/steps'
	
	xmlns:db	=	'http://docbook.org/ns/docbook'
	xmlns:xhtml	=	'http://www.w3.org/1999/xhtml'
	xmlns		=	'http://www.w3.org/1999/xhtml'
	
	xpath-version=	'2.0'
	version		=	'1.0'
	
	exclude-inline-prefixes="#all"
	
	name		=	'untitled'
>
	
	
	
	<!--	
		I/O
	-->
	<p:input	port='source'>
		<p:document href='src/docbook/docbook.xml' />
	</p:input>
	
	<p:output
		port	=	'result'
		primary	=	'true'
		sequence=	'true'
	/>
	<p:output
		port	=	'xhtml5'
		primary	=	'false'
		sequence=	'true' 
	/>
		
	
		
	
	
	
	<p:serialization
		port			='result' 
		doctype-public	=''
		doctype-system	='"about:legacy-compat"'
		encoding		='UTF-8'
		indent			='true'
		media-type		='application/xhtml+xml'
		method			='xhtml'
		omit-xml-declaration='false'
		version			='1.0' 
	/>
	<p:serialization
		port			='xhtml5'
		doctype-public	=''
		doctype-system	='"about:legacy-compat"'
		encoding		='UTF-8'
		indent			='true'
		media-type		='application/xhtml+xml'
		method			='xhtml'
		omit-xml-declaration='false'
		version			='1.0' 
	/>
	
	
	<!--	
		Imports
	-->
	<p:import	href='http://xmlcalabash.com/extension/steps/library-1.0.xpl'	/>
	<p:import	href='http://xmlcalabash.com/extension/steps/fileutils.xpl'		/>


	<!--
		PIPELINE BODY
	-->
	<p:group name='body' xmlns='http://www.w3.org/1999/xhtml'>
		
		<p:xinclude	/>
		
		<p:delete 
			match="	processing-instruction('oxygen') | 
					processing-instruction('xml-stylesheet')
					
					" 
		/>
		
		<p:xslt>
			<p:input port='stylesheet'>
				<p:document href='../../../mylib/oxygen/frameworks/docbook5/xsl/DocBook5%20(single%20HTML)%20Custom.xsl' />
			</p:input>
			<p:input port='parameters'>
				<p:empty />
			</p:input>
		</p:xslt>
		
		
		<p:group name="xhtml-cleanup">
			<p:delete	match	= 'xhtml:hr' 									/>
			
			<p:rename	match	= 'xhtml:div[ @class="titlepage" ]' 
						new-name= 'header'
						new-namespace=	'http://www.w3.org/1999/xhtml'
			/>
			
			<p:rename	match		 = 'xhtml:div[ matches(@class,"part|chapter|section|glossary|appendix" ) ]' 
						new-name	 = 'section'
						new-namespace= 'http://www.w3.org/1999/xhtml'
			/>
			
			<p:unwrap	match	= 'xhtml:header//xhtml:div[ not(exists(@class)) ]'	/>
			
			<p:delete	match	= 'xhtml:nav//xhtml:*[ @class="toc" ]//xhtml:*[ @class="part" ]//xhtml:*[ @class="chapter" ]//xhtml:*[ @class="section"]//xhtml:ol'/>
			<p:delete	match	= 'xhtml:section[ @class="chapter" ]/xhtml:nav//xhtml:ol//xhtml:ol'/>
			<p:delete	match	= 'xhtml:section/@title|xhtml:*[ @class="book" ]/@title' />
			
			<!--<p:viewport match='xhtml:pre[ contains(@class,"programlisting") ]'>-->
				<p:wrap	match	='xhtml:pre[ contains(@class,"programlisting") ]' 
						wrapper	='code'
						wrapper-namespace='http://www.w3.org/1999/xhtml' />
				<!--				
					@TODO
						Add step(s) to copy the programming language
						from pre/@class to code/@class 
						
						(leaving 'pre/@class' value 'programlisting' intact)
				-->
			<!--</p:viewport>-->
			
			<p:insert match='xhtml:head' position='last-child'>
				<p:input port="insertion">
					
					<!--<p:inline>
						<link rel="stylesheet" type="text/css" href="jquery.snippet.min.css" />
					</p:inline>-->
					<!--<p:inline>
						<script text="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"> </script>
					</p:inline>-->
					
					<p:inline>
						<script type="text/javascript" src="yepnope.1.0.2-min.js"> </script>
					</p:inline>
					<p:inline>
						<script type="text/javascript" src="index.js"> </script>
					</p:inline>
				</p:input>
			</p:insert>
			
		</p:group>
		
		
		<p:identity	name	= 'transformed-product' 						/>
		
		
		<p:store	name				= 'store-result'
					doctype-public		= ''
					doctype-system		= 'about:legacy-compat'
					href				= 'build/xproc-output.xhtml' 
					indent				= 'true' 
					omit-xml-declaration= 'false'							/>
		
		<p:identity>
			<p:input port= 'source'>
				<p:pipe port= 'result' step= 'transformed-product' 			/>
			</p:input>
		</p:identity>
		
	</p:group>
	
</p:declare-step>
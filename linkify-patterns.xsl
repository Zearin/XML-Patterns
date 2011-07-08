<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	
	xmlns:db	=	"http://docbook.org/ns/docbook"
	xmlns:xhtml	=	"http://www.w3.org/1999/xhtml"
	
	exclude-result-prefixes="xs xd xhtml db"
	
	
	version="2.0">
	
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Mar 9, 2011</xd:p>
			<xd:p><xd:b>Author:</xd:b> amrogers</xd:p>
			<xd:p></xd:p>
		</xd:desc>
	</xd:doc>
	
	
	<xsl:template name="linkify-patterns" as="db:xref">
		<xsl:param name="needle" as="xs:string" />
		<xsl:param name="haystack" as="xs:string" />
		<xsl:param name="target-uri" as="xs:anyURI" />
		
		<xsl:element name="xref">
			<xsl:attribute name=""></xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
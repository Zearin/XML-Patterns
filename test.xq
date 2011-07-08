xquery version "1.0";

declare namespace db = 'http://docbook.org/ns/docbook';

document {
	<html>
		<body>
		{	
			for	$category at $cindex	in	//db:*[ @role='category' ]
			let	$ctitle 	:=	$category/db:info/db:title/text(),
				$cabstract	:=	$category/db:info/db:abstract/db:*
			return
			(
				<h1>{concat($cindex,'. '), $ctitle}</h1>,
				<p>{$cabstract}</p>,
			
				for $pattern at $pindex	in	$category/db:*[ @role='pattern' ]
				let $ptitle		:=	$pattern/db:info/db:title/text(),
					$abstract	:=	$pattern/db:info/db:abstract/db:para
				return
				(
					<h2>{string-join( ($cindex cast as xs:string,$pindex cast as xs:string),'.' ),'. ',$ptitle}</h2>,
					<p>{$abstract}</p>
				)
			)
		}
		</body>
	</html>
}
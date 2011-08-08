/**
 *	Load JS (and JS-related assets) without blocking 
 *	page load-time
 *	
 *	@see
 *		http://yepnopejs.com
 */
yepnope({
	
	load: [	
			'http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js', 
			'jquery.snippet.min.css', 
			'jquery.snippet.min.js' 
	],
			
	complete: function(){
		
		$(document).ready(function(){
			$('pre.xml').snippet('xml');	//	@FIXME	lose snippet
			$('pre.dtd').snippet('dtd');	//	@FIXME	lose snippet
		})	
		
	}
})

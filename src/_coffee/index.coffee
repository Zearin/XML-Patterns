yepnope
	load: [ 
		'http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js', 
		'jquery.snippet.min.css', 
		'jquery.snippet.min.js' ]
	complete: ->
	$( document ).ready ->
		$('pre.xml').snippet 'xml'
		$('pre.dtd').snippet 'dtd'

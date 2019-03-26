<html><head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" type="image/png" href="../favicon.png">
<link rel="apple-touch-icon" href="../favicon.png">
<title>{{Know-it-all}} {{incentivize Q&A!}}</title>
</head><body style="color:rgba(255,255,255,0.9);background:#3d84a8;display:flex;flex-direction:column;align-items:center;justify-content:center;height:90%;font-family:Arial;text-align:center;">
<style>
	.button > a{ color:rgba(255,255,255,0.9);text-decoration:none;border:2px solid;border-radius:0.8em;padding:0.1em 0.39em 0.1em 0.25em;}
	div#license a{color:rgba(255,255,255,0.9);text-decoration:none;}
</style>
<img src="../Know-it-all.svg"></img>
<p class="button" style="text-align:center;font-size:4vw;">
{{Oops, this link only works with}} O<sub>byte</sub><br />
<a href="https://obyte.org/#download">{{Get it}}</a> {{and retry this link}}
</p>
<div id="pair_link" class="button" style="font-size:2vw;width:80%;"></div>

<div style="margin:3em;font-size:3vw;">
<div id="languages" class="button"></div>
</div>
	
<div id="license" style="font-size:xx-small;margin:8vh;opacity:0.5;">
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">cc-by-sa</a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Redirect link with instruction</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://particiate.net" property="cc:attributionName" rel="cc:attributionURL">whoisterencelee</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a><br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://particiate.net" rel="dct:source">https://particiate.net</a>
</div>
<script>
	pairing_code = location.hash || "#new"
	pairing =  "byteball:Ai9tK3w0yQNvbR8kpQU5uOLRloQQXdFXJFFNZkdQN8fr@byteball.org/bb" + pairing_code
	document.getElementById( "pair_link" ).innerHTML = '<a href="' + pairing + '">' + pairing + '</a>'

	try{

//	Why other methods won't work:

//	using meta tag <meta http-equiv="Refresh" content="0; url=byteball:Ai9tK3w0yQNvbR8kpQU5uOLRloQQXdFXJFFNZkdQN8fr@byteball.org/bb#@11" />
//	doesn't work because I need to grab the query and hash, redirect the hash with javascript

//	fetch only does http request, so non http protocol will not work
//	fetch( pairing ).then( response => console.log( response ) )

	var lhtml = "" , languages = {{LANGUAGE}}
	Object.entries( languages ).forEach( o => {
		lhtml += ' <a href="' + location.origin + "/" + o[ 1 ] + "?instruct" + pairing_code + '">' + o[ 0 ] + '</a> '
	} )
	document.getElementById( "languages" ).innerHTML = lhtml

	if( location.search == "" ) location.replace( pairing )

	}catch( e ){ 
		location.search = "instruct" + pairing_code  
		// insert a query will reload this page without above location.replace and show instructions above
	}

</script>
</body></html>

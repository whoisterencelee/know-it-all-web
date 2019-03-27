fs = require( 'fs' )
const tpl = fs.readFileSync( "index.tpl" )

if( !tpl ) return console.log( "missing index.tpl" )

const html = tpl.toString()

function parse( lang ){ return html.replace( /{{([^}]*)}}/g , ( d , d1 ) => lang[ d1 ] || d1 ) }

fs.readdir( "./languages" , ( err , files ) => {

	// generate Language object first
	var languages = []
	files.forEach( file => {
		var lang = require( "./languages/" + file )
		var iso = file.replace( /\..*/g , "" )
		languages.push( [ lang[ "LANGUAGE" ]  ,  iso ] )
	})

	console.log( JSON.stringify( languages ) )

	files.forEach( file => {
		var lang = require( "./languages/" + file )
		lang[ "LANGUAGE" ] = JSON.stringify( languages )
		console.log( lang )
		var dir = file.replace( /\..*/g , "" )
		fs.mkdir( dir , ( err ) => {
			fs.writeFile( dir + "/index.html" , parse( lang ) , err => console.log( err ) )
		})

	})
})

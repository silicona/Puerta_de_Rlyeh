# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready () ->
	$('#carrusel').carousel({	interval: 5000 })

$('.inscripcion').on 'click', (titulo, contenido) ->
	# console.log("Dentro")
	$('body').append('<div id="box"></div>')
	$('#box').append('<div id="mensaje"></div>')
	$('#mensaje').append('<h3 id="titulo"></h3>')
	$('#titulo').html(titulo)
	$('#mensaje').append('<p id="contenido"></p>')
	$('#contenido').html(contenido)
	$('#mensaje').append('<input type="button" id="boton_cierre" value="Cerrar" onclick="cerrarPop()">')

cerrarPop = () ->
	$('#box').remove()


# $('#boton_cierre').on 'click',	cerrarPop()

#	$('#carrusel').on 'slide.bs.carousel', () ->
#		console.log "Va pasar una imagen"
	
#	$('#carrusel').on 'slid.bs.carousel', () ->
#		console.log "Ha pasado una imagen"
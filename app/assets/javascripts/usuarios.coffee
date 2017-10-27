# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', (evento) ->
	$('#usuario_matriculado').on 'change', (evento) ->
		if evento.target.checked
			$('#matricula_completa').css('display', 'block');
			#$('#residencia').fadeIn("slow");
			$('#matricula_completa').css('opacity', '1');
		else
			$('#matricula_completa').css('display', 'none');
			$('#matricula_completa').css('opacity', '0');
		#console.log(evento.currentTarget.value.checked);
		#verObjeto(evento);

	$('#usuario_residente').on 'change', (evento) ->
		if evento.target.checked
			$('#residencia').css('display', 'block');
		else
			$('#residencia').fadeOut();
			$('#residencia').css('display', 'none');

	$('#imagen_subir').on 'select', (evento) ->
		console.log(evento);
		# $('#ver_imagen_elegida');

cerrarPop = () ->
	$('#box').remove()

pop_box = (titulo, contenido) ->
	console.log("Dentro")
	$('body').append('<div id="box"></div>')
	$('#box').append('<div id="mensaje"></div>')
	$('#mensaje').append('<h3 id="titulo"></h3>')
	$('#titulo').html(titulo)
	$('#mensaje').append('<p id="contenido"></p>')
	$('#contenido').html(contenido)
	$('#mensaje').append('<input type="button" id="boton_cierre" value="Cerrar">')
	$('#boton').on 'click', cerrarPop


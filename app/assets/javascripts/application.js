// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

// Ver en fijas.coffee
	//$(document).ready(function(){
		//$('#carrusel').carousel({	interval: 5000 });
		// $('.right').click(function(){
		// 	$('.carousel').carousel('next');
		// });
			
		// 	// Evento de pasar imagen
		// $("#carrusel").on('slide.bs.carousel', function () {
  	//       // alert('A new slide is about to be shown!');
  	//     console.log("Va a pasar una nueva imagen")
  	//   });

		// 	// Evento despues de pasar imagen
  	//   $("#carrusel").on('slid.bs.carousel', function () {
  	//       //alert('The carousel has finished sliding from one item to another!');
  	//       console.log("El carrusel ha pasado la imagen anterior")
  	//   });
	//});

	// function hacerPop(evento, titulo, mensaje){
	// 	console.log(evento);
	// 	evento.preventDefault();
	// }

	//document.getElementByClassName('').addEventListener
// $(document).ready(function(){
// 	$('.boton_asignatura .descripcion').click(function(evento){
// 		titulo = evento.target;
// 		contenido = evento.target.attributes[1].value;
// 		//console.log(typeof contenido);
// 		hacerPopBox(titulo, contenido);
// 		//enlace = evento.target;
// 		//console.log(.attr('data'));
// 		//hacerPopBox('Descripción', this.asignatura.descripcion);
// 	});
// });

function hacerPopBox(titulo, contenido){
	if(contenido == "Matriculate"){
		contenido = "Matricúlate en el Colegio para inscribirte en una asignatura.<br>Puedes hacerlo en <a href=\"#{registro_path}\">el registro de la secretaría</a>."
	}

	if(!$('#box')[0]){
		$('body').append('<div id="box"></div>');
		$('#box').css('height', $(document).height() + "px")
		$('#box').append('<div id="mensaje"></div>');
		altura = $(document).scrollTop() + $(window).height()/4;
		$('#mensaje').css('top', (altura + "px"));
		$('#mensaje').append('<h3 id="titulo"></h3>');
		$('#box #titulo').html(titulo);
		$('#mensaje').append('<p id="contenido"></p>');
		$('#box #contenido').html(contenido);
		$('#mensaje').append('<input type="button" class="btn btn-success" id="boton_cierre" value="Cerrar" onclick="cerrarPop()">');
	}
}

function cerrarPop(){
	$('#box').remove();
}

$('.volver_atras').click(function(evento){
	console.log("dentro");
	history.back();
	return false;
});

function verPoliticaPrivacidad(){
	var titulo = "Política de Privacidad";
	//var mensaje = "Nuestra politica de privacidad esta por definir";
	var mensaje = "Este sitio web ha sido diseñado y realizado como material expositivo de mi trabajo, sin intencion de infringir ni menoscabar derechos de autoria o imagen de terceros.<br>"
	mensaje += "Los datos utilizados en la creacion de la matricula no serán utilizados de ninguna manera, salvo como parte del funcionamiento de esta web expositoria. La base de datos se elimina de forma regular y no se guardan registros personales.<br>"
	mensaje += "Cualquier parecido con alguna persona fisica o juridica es mera coincidencia.<br>";
	mensaje += "Pueden contactar con el autor a traves del email alejoizquierdomartinez@gmail.com";
	hacerPopBox(titulo, mensaje);
}



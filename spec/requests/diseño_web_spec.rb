require 'rails_helper'

RSpec.feature "Diseño de Web" do

	fixtures :usuarios

	setup do
		@sara = usuarios(:sara)
		@shilum = usuarios(:shilum)
		@clara = usuarios(:clara)
	end

		# matriculado = false, email = false, ciudad = false, pais = false, residente = false, residencia = false)		
	def registrar_basico(nombre, password = 'p455w0rd')
		fill_in("nombre", with: nombre)
		fill_in("Elige una contraseña con letras y números:",with: password)
		fill_in("Repite la contraseña", with: password)

		click_on "Crear perfil"
	end
	
	feature "Anónima y la web" do
	  scenario "Anónima pasea por la web" do
	    visit :inicio
	    expect(page).to have_http_status(200)
	    expect(page.find('ul.nav')).to have_content "Colegio Claustro Instalaciones Acceder Secretaria Galeria"
	    expect(page).to have_selector("a[href=\"" + acceder_path + "\"]")   
	    expect(page).to have_no_selector("a[href=\"" + promocion_path + "\"]")
	    page.has_link?("Colegio")
	    page.assert_title("inicio")

	    visit :colegio
	    expect(page).to have_http_status(200)
	    expect(page).to have_current_path colegio_path

	    visit :secretaria
	    expect(page).to have_http_status(200)
	    expect(page).to have_current_path secretaria_path
	  end

	  scenario "Anonima no puede ir a paginas de usuarios" do
	    visit ver_perfil_path(@sara.nombre)
	    expect(page).to have_http_status(200)
	    expect(page).to have_current_path acceder_path
	    expect(page.find('div.alert-danger')).to have_content "Por favor, accede primero"

	    visit editar_perfil_path(@sara.nombre)
	    expect(page).to have_http_status(200)
	    expect(page).to have_current_path acceder_path
	    expect(page.find('div.alert-danger')).to have_content "Por favor, accede primero"

	    visit :promocion
	    expect(page).to have_http_status(200)
	    expect(page).to have_current_path acceder_path
	    expect(page.find('div.alert-danger')).to have_content "Por favor, accede primero"

	    visit cancelar_path(@sara.nombre)
	    expect(page).to have_http_status(200)
	    expect(page).to have_current_path acceder_path
	    expect(page.find('div.alert-danger')).to have_content "Por favor, accede primero"
	  end

	  scenario "Anonima se registra de forma básica mal y bien" do
	  	visit :registro
	  	expect(page).to have_http_status(:success)
	    page.assert_title("nuevo")
	    expect(page.find("form")['action']).to have_content registro_path
	    expect(page.find("form")['method']).to have_content 'post'
	    expect(page.find("label[for='usuario_password_confirmation']")).to have_content "Repite la contraseña"

			registrar_basico("Kamut", "p0p0")
			expect(page).to have_http_status(:success)
			expect(page).to have_current_path registro_path
			expect(page.find('div#explicacion_error li:first-of-type')).to have_content "Password debe tener por lo menos 8 caracteres"

			registrar_basico("jamon", "")
			expect(page).to have_http_status(:success)
			expect(page).to have_current_path registro_path
			expect(page.find('div#explicacion_error li:first-of-type')).to have_content "Password can't be blank"
			
			registrar_basico("dorothy")
			expect(page).to have_http_status(:success)
			expect(page).to have_current_path ver_perfil_path("dorothy")
			expect(page).not_to have_selector 'div#explicacion_error li:first-of-type'

	  end

	  scenario "Anonima se registra de forma completa" do
	  	visit :registro

			fill_in("nombre", with: "Federico")
			fill_in("Elige una contraseña con letras y números:",with: "p455w0rd")
			fill_in("Repite la contraseña", with: "p455w0rd")

		  check "usuario[matriculado]"
		  fill_in("email", with: "email@valido.com")
		  fill_in("ciudad", with: "Madagascar")
		  fill_in("pais", with: "Pernambuco")

		  check "usuario[residente]"
		  choose("usuario[residencia]", { option: "individual" })

			click_on "Crear perfil"

			expect(page).to have_http_status(:success)
			expect(page).to have_current_path ver_perfil_path("federico")
			expect(page.find("div.alert-success")).to have_content "Tu perfil se ha creado correctamente."
			expect(page.find('.datos li:first-of-type')).to have_content "email@valido.com"
	  end

	  scenario "Anonima no tiene datos sin matricula" do
	  	visit :registro

			fill_in("nombre", with: "Federico")
			fill_in("Elige una contraseña con letras y números:",with: "p455w0rd")
			fill_in("Repite la contraseña", with: "p455w0rd")

		  fill_in("email", with: "email@valido.com")
		  fill_in("ciudad", with: "Madagascar")
		  fill_in("pais", with: "Pernambuco")

		  check "usuario[residente]"
		  choose("usuario[residencia]", { option: "individual" })

			click_on "Crear perfil"

			expect(page).to have_http_status(:success)
			expect(page).to have_current_path ver_perfil_path("federico")
			expect(page.find("div.alert-success")).to have_content "Tu perfil se ha creado correctamente."
			expect(page.find('.datos li:first-of-type')).to have_content "Email: Completa tu matrícula"
	  end
	end
	
	feature "Usuario y la web" do
	  scenario "Usuario básico accede y ve su perfil" do
	  	conceder_acceso_a @clara
	  	expect(page.find('ul.nav')).to have_content "Colegio Profesorado Tu campus Tu perfil Ver tu perfil Tu promoción Configuracion Chat Salir Secretaria Galeria"
	  	expect(page).to have_selector("div.alert-success", text: "Bienvenido de nuevo, " + nominalizar(@clara.nombre))
	  	expect(page.find('img.gravatar')['src']).to have_content /avatar_prueba/
	  	expect(page.find('.datos li:first-of-type')).to have_content "Email: Completa tu matrícula"
	  	#expect(page.find('.asignaturas')).to have_content "Completa tu matrícula para inscribirte en las asignaturas"
	  	expect(page.find('.apuntes')).to have_content /No hay ningún apunte/i
	  	expect(page.find('.apuntes form')['action']).to have_content apuntes_path(@clara.nombre)
	  	expect(page).to have_selector('.cancelar')
	  end

	  scenario "Usuario edita su perfil a matricula completa" do
	  	conceder_acceso_a @clara
		  visit editar_perfil_path(@clara.nombre)
		  expect(page.find('h2')).to have_content "Editar tu perfil"
		  expect(page.find("form")['action']).to have_content actualizar_path(@clara.nombre)
		  expect(page.find("form")['method']).to have_content 'post'

		  check "usuario[matriculado]"
		  fill_in("email", with: "email@valido.com")
		  fill_in("ciudad", with: "Madagascar")
		  fill_in("pais", with: "Pernambuco")

		  check "usuario[residente]"
		  choose("usuario[residencia]", { option: "individual" })

		  click_on "Editar perfil"

		  expect(page).to have_http_status(:success)
		  expect(page).to have_current_path ver_perfil_path(@clara.nombre)

		  expect(page).to have_selector('div.alert-success', text: "Tu perfil se ha actualizado")
		  expect(page).to have_selector('.datos li:first-of-type', text: "email@valido.com")
	  	#expect(page.find('.asignaturas a')['href']).to have_content secretaria_path 
	  end

	  scenario "Usuario cancela su cuenta" do
	  	conceder_acceso_a @sara
	  	click_link "Cancelar cuenta"

	  	expect(page).to have_http_status(:success)
	  	expect(page).to have_current_path cancelar_path(@sara.nombre)

	  	fill_in "Contraseña", with: "p455w0rd"
	  	fill_in "Confirmar contraseña", with: "p455w0rd"
	  	click_on "Cancelar cuenta"

	  	expect(page).to have_http_status(:success)
	  	expect(page).to have_current_path root_path
	  	expect(page.find('div.alert-success')).to have_content "El usuario se ha borrado"
	  end
	end
end

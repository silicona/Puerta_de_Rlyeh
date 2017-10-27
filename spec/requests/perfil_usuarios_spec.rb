require 'rails_helper'

RSpec::feature "Usuario utiliza su perfil" do

	fixtures :usuarios

	setup do
		@sara = usuarios(:sara)
		@shilum = usuarios(:shilum)
		@clara = usuarios(:clara)
	end

	scenario "Accede al site y llega a su perfil" do
		visit root_path
		click_link "Acceder"
    expect(page).to have_http_status(200)
		expect(page).to have_content "Escribe tu contraseña"

		fill_in("nombre", with: "sara")
		fill_in("Escribe tu contraseña", with: "p455w0rd")
		click_on "Accede al colegio"
    expect(page).to have_http_status(200)
    expect(page).to have_title("mostrar | Puerta de R'lyeh")
    expect(page).to have_current_path("/ver_perfil/" + @sara.nombre)
		expect(page).to have_content "Bienvenido de nuevo, " + nominalizar(@sara.nombre)
    expect(page).to have_selector("h2", text: "Perfil de " + nominalizar(@sara.nombre))
    expect(page).to have_selector("a[href=\"" + cancelar_path(@sara.nombre) + "\"]")
    #expect(page.find('img.gravatar')['src']).to have_content "https://secure.gravatar.com/avatar/a92f2e10d00c1b486f28c388ee1d41e0?s=150"
    expect(page.find('img.gravatar')['src']).to match /\/secure.gravatar.com\/avatar\//
		click_link "Salir"
		expect(page).to have_current_path("/")

		click_link "Acceder"
		fill_in('nombre', with: "shilum")
		fill_in("Escribe tu contraseña", with: "p455w0rd")
		click_on "Accede al colegio"
    expect(page).to have_current_path("/ver_perfil/" + @shilum.nombre)
    	# Por Avatar Uploader
    expect(page.find('img.gravatar')['src']).to have_content "/imagenes/shilum/becario.jpg"
    #expect(page.find('img.gravatar')['src']).to have_content "/assets/becario-bebd2a47f35e530fc49b3c5564a08af44fd5d73559335b780732090cab484cea.jpg"
 		expect(page).to have_content("Cancelar cuenta")

		click_link "Salir"
		expect(page).to have_current_path("/")

		click_link "Acceder"
		fill_in('nombre', with: "clara")
		fill_in("Escribe tu contraseña", with: "p455w0rd")
		click_on "Accede al colegio"
    expect(page).to have_current_path("/ver_perfil/" + @clara.nombre)
    expect(page.find('img.gravatar')['src']).to have_content "/assets/avatar_prueba-c2b2a18a5b1251336971cd05df38264a019023a6a078543c665646271c4c8c5c.jpg"
	end


	scenario "Debe usar datos válidos para acceder" do
		visit root_path
		click_link("Acceder")
		expect(page).to have_content "Escribe tu contraseña"
		
		fill_in("nombre", with: "sara")
		fill_in("Escribe tu contraseña", with: "p0p0p0p0")
		click_on('Accede al colegio')
		expect(page).to have_content "El nombre o la contraseña no son correctos"
	end

	scenario "Usuario edita su perfil" do
		conceder_acceso_a @sara
		expect(page).to have_content "Bienvenido de nuevo, " + nominalizar(@sara.nombre)
		click_link('Configuracion')
		expect(page.find('h2')).to have_content "Editar tu perfil"
	end

	scenario "Usuario va a otro perfil" do
		conceder_acceso_a @sara
		click_link("Tu promoción")
		expect(page).to have_current_path("/promocion")
		click_link("Shilum")
		expect(page).to have_current_path(ver_perfil_path(@shilum.nombre))
		expect(page).to have_no_content("Cancelar cuenta")
	end

	scenario "Usuario no puede editar o borrar otro perfil" do
		conceder_acceso_a @sara

		visit editar_perfil_url(@shilum.nombre)
		expect(page).to have_current_path("/")
		expect(page.find('div.alert-danger')).to have_content "No tienes permiso"

		visit cancelar_path(@shilum.nombre)
		expect(page).to have_current_path("/")
		expect(page.find('div.alert-danger')).to have_content "No tienes permiso"

		visit eliminar_path(@shilum.nombre)
		expect(page).to have_current_path("/")
		expect(page.find('div.alert-danger')).to have_content "No tienes permiso"
	end
end


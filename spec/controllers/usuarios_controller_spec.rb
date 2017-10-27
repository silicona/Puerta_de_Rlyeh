require 'rails_helper'


RSpec.describe UsuariosController, type: :controller do
  setup do
    @shilum = Usuario.create!(nombre: "Fermin", password: 'p455w0rd', password_confirmation: 'p455w0rd')
    @invitada = Usuario.create!(nombre: "Luna", password: 'p455w0rd', password_confirmation: 'p455w0rd')
    @potencial = Usuario.new(nombre: "Marte", password: 'p455w0rd', password_confirmation: 'p455w0rd')
  end

  describe "Creando Usuario" do
    it "Llegando al registro" do
      get :nuevo
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('nuevo')
    end

    it "Registro invalido" do
      post :crear, params: { usuario: {nombre: "paquita", password: '', password_confirmation: ''} }
      expect(response).to have_http_status(:success)
      expect(assigns(:usuario).errors.full_messages).to have_content "Password can't be blank"
    end
    
    # it "probando registros con be_a_new" do
    #   @potencial.password = "dd3"
    #   expect(@potencial).to be_a_new(Usuario)
    # end

    it "Enviar registro y da acceso al usuario" do
      clara = post :crear, params: { usuario: {nombre: "paquita", password: 'p455w0rd', password_confirmation: 'p455w0rd'} }

      expect(response).to have_http_status(302)
      expect(esta_logeado?).to be true
      expect(response.body).to have_content('You are being redirected.')
    end
  end

  describe "Editar el perfil" do
    before do
      acceso_describe(@shilum)
    end

    it "Llega a editar" do
      get :editar, params:{ nombre: @shilum.nombre }
      expect(response).to render_template(:editar)
      expect(response).to have_http_status(:success)
    end

    it "Errores en la edición" do
      patch :actualizar, params: { nombre: @shilum.nombre,
                                   usuario: { nombre: "",
                                              password: "foo",
                                              password_confirmation: "bar",
                                              matriculado: false } }
      expect(response).to have_http_status(:success)
      expect(response.body).to render_template "usuarios/editar"
      expect(assigns(:usuario).errors.full_messages).to have_content ["Nombre está en blanco",
                                                                      "Password debe tener por lo menos 8 caracteres",
                                                                      "Password debe contener letras y números"]
    end
  
    it "Edita el perfil correctamente" do
      patch :actualizar, params: { nombre: @shilum.nombre,
                                    usuario: { nombre: @shilum.nombre,
                                               password: "",
                                               matriculado: true,
                                               ciudad: "parla", pais: "Chiquistan",
                                               email: "miemail@valido.es",
                                               residente: true, residencia: "Compartida" } }
      expect(assigns(:usuario).errors.full_messages).to have_content []
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to ver_perfil_path(assigns(:usuario).nombre)
    end
  end

  describe "Borrar perfil" do
    it "Redirige a acceso sin haber accedido" do
      get :borrar, params: { nombre: @shilum.nombre }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to acceder_path
      delete :borrar, params: { nombre: @shilum.nombre }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to acceder_path
    end

    it "Redirige al root ser el propietario" do
      acceso_describe @invitada
      get :borrar, params: { nombre: @shilum.nombre }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to root_path
      delete :borrar, params: { nombre: @shilum.nombre }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to root_path
    end

    it "Usuario puede borrar su perfil" do
      acceso_describe @shilum
      get :borrar, params: { nombre: @shilum.nombre }
      expect(response).to have_http_status(:success)

      delete :borrar, params: { nombre: @shilum.nombre }
      expect(response).to have_http_status(:found)
      expect(response).to have_xpath("/")
    end
  end

  describe "Ver perfil" do
    it "redirige sin acceso" do
      get :mostrar, params: { nombre: @shilum.nombre}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to acceder_path
    end

    it "Ver el perfil propio y ajeno con acceso" do
      acceso_describe @shilum
      get :mostrar, params: { nombre: @shilum.nombre }
      expect(response).to have_http_status(:success)
      expect(response).to render_template "usuarios/mostrar"

      get :mostrar, params: { nombre: @invitada.nombre }
      expect(response).to have_http_status(:success)
      expect(response).to render_template "usuarios/mostrar"
    end
  end

  describe "Ver promocion" do
    it "redirige sin acceso" do
      get :conjunto
      expect(response).to have_http_status(302)
      expect(response).to redirect_to acceder_path
    end

    it "Permite ver la promocion con acceso" do
      acceso_describe @shilum
      get :conjunto
      expect(response).to have_http_status(200)
      expect(response).to render_template "usuarios/conjunto"
    end
  end

  describe "Validación de matricula y residente" do
    before do 
      @usuario = { usuario: { nombre: Faker::Hobbit.character,
                              password: 'p455w0rd',
                              password_confirmation: 'p455w0rd',
                              matriculado: false,
                              email: "blabla@dominio.es",
                              pais: "Yopilandia",
                              ciudad: "Washington",
                              residente: false,
                              residencia: "individual" } }
    end

    it "No guarda datos de mail sin matricula" do
      post :crear, params: @usuario
      @usuario = assigns(:usuario)
      expect(@usuario.reload.email).not_to eq "blabla@dominio.es" 
      expect(@usuario.reload.email).to be nil 
    end

    it "No guarda residencia sin residente" do
      @usuario[:usuario][:matriculado] = true
      post :crear, params: @usuario
      @usuario = assigns(:usuario)
      expect(@usuario.reload.residente).not_to be true
      expect(@usuario.reload.residencia).not_to eq "individual"
    end
  end
end

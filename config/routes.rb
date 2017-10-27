Rails.application.routes.draw do
  get '/examinar/:nombre', to: "asignaturas#examinar", as: "examinando"
  patch '/calificacion', to: "asignaturas#calificar", as: "calificar"
  
  get 'inscripciones/create'
  get 'inscripciones/destroy'

  get '/acceder', to: "sesiones#nuevo"
  post "/acceder", to: "sesiones#crear"
  delete "/salir", to: "sesiones#destruir"

  # get 'usuarios/crear'
  get '/registro', to: "usuarios#nuevo"
  post '/registro', to: "usuarios#crear"

  # get 'usuarios/editar'
  get 'editar_perfil/:nombre', to: "usuarios#editar", as: 'editar_perfil'
  # get 'usuarios/actualizar'
  patch '/usuarios/:nombre', to: "usuarios#actualizar", as: 'actualizar'
  put '/usuarios/:nombre', to: "usuarios#actualizar"

  get '/cancelar_cuenta/:nombre', to: 'usuarios#borrar', as: 'cancelar'
  delete '/cancelar_cuenta/:nombre', to: "usuarios#borrar", as: 'eliminar'

  delete 'borrar_apunte/:nombre', to: "usuarios#borrar_apunte", as: "borrar_apunte"
  patch 'apuntes/:nombre', to: "usuarios#apuntar", as: 'apuntes'
  get '/ver_perfil/:nombre', to: "usuarios#mostrar", as: "ver_perfil"

  get '/promocion', to: "usuarios#conjunto", as: "promocion"

  post '/subir/:nombre', to: "usuarios#subir", as: "subir"

  get '/inicio', to: "fijas#inicio"
  get '/colegio', to: "fijas#colegio"
  get "/claustro", to: "fijas#claustro"
  get '/lugares', to: "fijas#lugares"
  get '/galeria', to: "fijas#galeria"
  get '/secretaria', to: "fijas#secretaria"

  resources :inscripciones, only: [:create, :destroy]

  root "fijas#inicio"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

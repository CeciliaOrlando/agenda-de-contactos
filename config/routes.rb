Rails.application.routes.draw do
  devise_for :users # autenticación y registración del usuario
  root to: "pages#home" # ruta raíz (por defecto) pagina de inicio sera gestionada por el controlador"pages" y su accion "home"
  get "contact", to: "pages#contacts" # ruta personalizada para la pagina de contactos
  post 'session', to: 'sessions#create'

  resources :contacts #Esta línea crea rutas RESTful para el recurso contacts. Esto genera automáticamente las siguientes rutas:
                        # GET /contacts  -index
                        # GET /contacts/:id  -show
                        # GET /contacts/new  -new
                        # POST /contacts  -create
                        # GET /contacts/:id/edit  -edit
                        # PATCH/PUT /contacts/:id -update
                        # DELETE /contacts/:id  -destroy
end

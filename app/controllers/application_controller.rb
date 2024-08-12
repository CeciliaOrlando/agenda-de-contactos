class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  # Esta línea de código es un middleware de Rails que se ejecuta antes de ejecutar
  # cualquier acción en los controladores. Esto significa que se ejecutará antes
  # de cualquier método de un controlador, incluyendo los métodos de Devise.
  #
  # La línea de código "before_action :authenticate_user!, unless: :devise_controller?"
  # significa que se ejecutará el método "authenticate_user!" solo si el controlador
  # no es un controlador de Devise.
  #
  # El método "authenticate_user!" es un helper proporcionado por Devise.
  # Este helper verifica si el usuario está autenticado y si no lo está, redirige al
  # usuario a la página de inicio de sesión.
  #
  # El parámetro "unless: :devise_controller?" significa que el middleware no se
  # ejecutará si el controlador es un controlador de Devise. Esto es necesario
  # para evitar un bucle infinito en el que el middleware intenta autenticar al
  # usuario para acceder a la página de inicio de sesión y Devise intenta
  # autenticar al usuario para acceder a la página de inicio de sesión.

end

class StaticPagesController < ApplicationController

  def home
    #cuando alguien entre a www.algo este va a ser mi
    # página de inicio, no tiene variable, pero si vista
    # mi vista se llama igual que mi accion (home)
    @name = current_user.present? ? current_user.email : 'Desconocido'
    #<!--Si existe current_user, ponle el email! de lo contrario, ponle desconocido!-->
    # <!--el método present se escribe así: present?, y los métodos terneatios son con ?-->
    # Este es un controlador sin base de datos, o sea solo maneja  vistas, por tanto no necsita modelo
  end
  #Cada controlador debe tener carpeta dentro de Viws
  #Para cada accion debe haber una vista!


end

class StaticsController < ApplicationController


  #No le puse def index ¿Por qué?
  # index, lo uso cuando quiero mostrar todos los registros de una tabla
  # no es correcto ponerle index... sino static_pages porque este no tiene que ver con las rutas, ni los verbos
  # Este StacitControoler, es un controlador sin verbos, aqui nunca vas a encontrar un show, destroy, create...
  # sino que aqui vamos a crear acciones que no están relacionadas con esos verbos
  def static_pages

  end

  #Dashboard
  def dahsboard
    @user = current_user.email

    @course_user = current_user.courses
    @alumns_in_your_curse = current_user.alumns
  end


end

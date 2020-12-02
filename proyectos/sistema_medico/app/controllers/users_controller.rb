class UsersController < ApplicationController
  #Por defecto, asumiremos que todos los usuarios de la plataforma son doctores
  before_action :authenticate_user!
  def room

    #@patient = Patient.where(user_id: current_user.id)
    @patient = current_user.patients
  end


end

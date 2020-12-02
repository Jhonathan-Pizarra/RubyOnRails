class Admin::UsersController < ApplicationController
  before_action :validar_admin

  def stadistic
    @doctors = User.all
    @visits = Visit.all
    @patients = Patient.all

    @doctors_admin = User.where(administador: true)
    @doctors_only = User.where(administador: false)

    #@doctor_array = @doctors.map(& :id)
    #@visits_array = @visits.map(& :id)
    #@mayor = @doctors[1].visits.size;
    @mayor = 0;
    for each in @doctors
      actual =  each.visits.count
      if(each.visits.size > @mayor)
        @mayor = each.visits.size
      end
    end

    @frecuent = 0;
    for each in @patients
      actual =  each.visits.count
      if(each.visits.size > @frecuent)
        @frecuent = each.visits.size
      end
    end
  end

  def index
    @users = User.all
    @name = current_user.present? ? current_user.email : 'Desconocido'

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Registro Exitoso!" #Notice debe ir siempre, es un mensaje
      redirect_to admin_users_path
    else
      render 'new'
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Modificado con exito!"
      redirect_to admin_users_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]) #solo los detalles del producto (id)
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :administador)
  end

  def validar_admin
    unless current_user.administador
      redirect_to root_path
    end
  end


end

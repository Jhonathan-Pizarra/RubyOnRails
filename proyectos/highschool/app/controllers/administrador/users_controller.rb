class Administrador::UsersController < ApplicationController

  #Antes de ejecutarse cualquiera de los métodos:
  before_action :validar_admin

  def index
    @users = User.all
  end

  #CRUD
  def new
    @user = User.new
  end

  #Crear
  def create
    @user = User.new(user_params)
    #@course_user = @user.courses #Los cursos de los maestros
    #@alumn_user = @user.alumns #los alumnos de los maestros

    if @user.save
      flash[:notice] = "Registro Exitoso!" #Notice debe ir siempre, es un mensaje
      redirect_to administrador_users_path
    else
      render 'new'
    end

  end

  #Mostrar
  def show
    @user = User.find(params[:id])
  end

  #Editar
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Modificado con exito!"
      redirect_to administrador_users_path(@user)
    else
      render 'edit'
    end
  end

  #Borrar
  def destroy
    @user = User.find(params[:id]) #solo los detalles del producto (id)
    @user.destroy
    redirect_to administrador_users_path
  end

  #Estadisticas
  def stadistics_users
    @users = User.all
    @admins = User.where(administrador: true)
    @teachers = User.where(administrador: false)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :administrador)
  end

  def validar_admin
    unless current_user.administrador
      redirect_to root_path
    end
  end

end

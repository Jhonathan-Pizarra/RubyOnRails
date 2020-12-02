#Este controlador es totalmente independiente de notice Controller, tiene vistas por separado y todos los métodos no puedo
# acceder desde el otro lado!
class Admin::NoticesController < ApplicationController
  before_action :authenticate_user!
  before_action :validar_admin

  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  #Métodos de crear y editar... y eliminar
  #HOME
  def index
    @notices = Notice.all #para tener acceso a la vista, @prudcos es como que global

  end

  #MOSTRAR
  def show
    #Ya lo está haciendo el before action de find_comment y en el método private está definido!
    #@notice = Notice.friendly.find(params[:id]) #solo los detalles del producto (id)
    #@producto = Producto.where( id: params[:id]) #query a la base de datos, trae los productos que tengan un id con el parametro id del url

  end

  #CREAR
  def new
    @notice = Notice.new #esto me en necesario para instanciar un objeto al momento de que cargue el crear, si no tengo nada creado aun, no me puede dar error

  end

  def create
    @notice = Notice.new(notice_params)
    #@notice.proveedor = Proveedor.first
    if @notice.save
      flash[:notice] = "Registro Exitoso!"
      redirect_to admin_notice_path(@notice) #Esto me redirecciona al new
    else
      render 'new'
    end

  end

  #EDITAR
  def edit
    #Pasa igual que con el showw !
    #@notice = Notice.friendly.find(params[:id])

  end

  def update

    if @notice.update(notice_params)
      flash[:notice] = "Modificado con exito!"
      redirect_to admin_notice_path(@notice)
    else
      render 'edit'
    end

  end

  #ELIMINAR
  def destroy

    @notice.destroy
    redirect_to admin_notices_path
  end

  #Método privado: solo acceden los métodos dentro de este contriller
  private
  def notice_params
    params.require(:notice).permit(:titulo, :descripcion_corta, :descripcion_larga, :user_id) #De los parametros que voy a recibir, revisa que siempre venga un parámetro de estos
    #luego de validar, permite que el usuario grabe el nombre y la descripcion
  end

  def validar_admin
    unless current_user.admin
      redirect_to dashboard_path
    end
  end

  def find_comment
    @notice = Notice.friendly.find(params[:id])

  end


end

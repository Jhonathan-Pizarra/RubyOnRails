class Administrador::CoursesController < ApplicationController

  def index
    @courses_admins = Course.all
    @courses = current_user.courses
  end

  #CRUD
  def new
    @course = Course.new

  end

  #Crear
  def create
    @course = Course.new(course_params)
    #@alumn_course = @course.alumns #los alumnos del curso

    if @course.save
      flash[:notice] = "Registro Exitoso!" #Notice debe ir siempre, es un mensaje
      redirect_to administrador_courses_path
    else
      render 'new'
    end

  end

  #Mostrar
  def show
    @course = Course.find(params[:id])
    @alumn_course = @course.alumns #Para cargar los alumnos de este curso

    #Voy a hacer mi CRUD de alumnos dentro del curso
    @alumn = Alumn.new
  end

  #Editar
  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "Modificado con exito!"
      redirect_to administrador_courses_path(@course)
    else
      render 'edit'
    end
  end

  #Borrar
  def destroy
    @course = Course.find(params[:id]) #solo los detalles del producto (id)
    @course.destroy
    redirect_to administrador_courses_path
  end

  #Estaditicas
  def stadistics
    @total_cursos = Course.all
    @total_alumnos = Alumn.all

    @curses = Course.all #Para hacer un loop de los alumnos de cada curso y su .size (ver la vista)

    @alumns = Alumn.all.ids
    @ward = 0
    for each in @alumns
    @most_age =  Alumn.find(each).age
    if (@most_age > @ward)
      @ward = @most_age
    end

    end

    #Para cada usuario:
    @course_user = current_user.courses
    @alumns_in_your_curse = current_user.alumns


  end

  private
  def course_params
    params.require(:course).permit(:name, :finicio, :ffinal, :user_id)
  end

  def validar_admin
    unless current_user.administrador
      redirect_to root_path
    end
  end

end

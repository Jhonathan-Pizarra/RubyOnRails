class VisitsController < ApplicationController

  def show
    @visit = Visit.all

  end

  def new
    @visit = Visit.new
    @current_patient = Patient.find(params[:id])
    @patient =  @current_patient.visit

  end

  def create
    @visit = Visit.new(visit_params)

    if @visit.save
      flash[:notice] = "Registro Exitoso!" #Notice debe ir siempre, es un mensaje
      redirect_to patient_path(@visit.patient) #Esto me redirecciona al new (
      #(admin) si este método está dentro de un cotrolador para admin
    else
      render 'new'
    end

  end

  def edit
    @visit = Visit.find(params[:id]) #solo los detalles del producto (id)

  end

  def update
    @visit = Visit.find(params[:id]) #solo los detalles del producto (id)
    if @visit.update(visit_params)
      flash[:notice] = "Modificado con exito!"
      redirect_to room_path(@visit)
    else
      render 'edit'
    end
  end

  def destroy
    @visit = Visit.find(params[:id]) #solo los detalles del producto (id)
    @visit.destroy
    redirect_to room_path(@visit)
  end

  private
  def visit_params
    params.require(:visit).permit(:user_id, :patient_id, :fecha, :motive, :diagnostic)
  end

end

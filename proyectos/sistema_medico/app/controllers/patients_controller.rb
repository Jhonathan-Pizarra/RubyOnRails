class PatientsController < ApplicationController
  before_action :authenticate_user!

    def stadistic
      @patient = current_user.patients
      @visit = current_user.visits
    end

    def new
      @patient = Patient.new
    end

    def create
      @patient = Patient.new(patient_params)

      if @patient.save
        flash[:notice] = "Registro Exitoso!" #Notice debe ir siempre, es un mensaje
        redirect_to room_path(@patient)
      else
        render 'new'
      end
    end

    def show
      @patient = Patient.find(params[:id])
      #A más de los pacientes, quiero que se me presenten las visitas.... pero de ése paciente
      @visit = Visit.new
      @visits = @patient.visits
    end

    def edit
      @patient = Patient.find(params[:id])
    end

    def update
      @patient = Patient.find(params[:id])
      if @patient.update(patient_params)
        flash[:notice] = "Modificado con exito!"
        redirect_to room_path(@patient)
      else
        render 'edit'
      end
    end

    def destroy
      @patient = Patient.find(params[:id]) #solo los detalles del producto (id)
      @patient.destroy
      redirect_to room_path
    end

    private
    def patient_params
      params.require(:patient).permit(:user_id, :ci, :name, :age, :height, :tblood, :allergy)
    end

    def find_visit
      @patient = Patient.find(params[:id])
    end


end

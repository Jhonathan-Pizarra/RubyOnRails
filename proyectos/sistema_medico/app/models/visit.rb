class Visit < ApplicationRecord
  belongs_to :user #doctor
  belongs_to :patient #visita pertenece a un paciente
end
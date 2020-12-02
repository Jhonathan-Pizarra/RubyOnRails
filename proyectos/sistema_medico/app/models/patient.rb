class Patient < ApplicationRecord
  has_many :visits #cuantas visitas ha tendido el paciente
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # Creado po Devise
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable nadie se va a poder registar, solo iniciar sesion,
         :recoverable, :rememberable, :validatable

  has_many :patients #puedo contar user.patients para saber cuantos pacientes
  has_many :visits #cuantas visitas ha tenido un doctor

  #Tengo usuarios. tabla users, creado po Devise
  # cuadno creo un genearate devise User, crea una migracion con una tabla: users y el modelo, este modelo de aqui
  # luego hacemos una migracion rails db:migrate


end

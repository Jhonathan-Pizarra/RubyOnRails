class Course < ApplicationRecord
  has_many :alumns
  belongs_to :user
end

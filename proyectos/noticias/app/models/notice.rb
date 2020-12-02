class Notice < ApplicationRecord
  extend FriendlyId
  friendly_id :titulo, use: :slugged #url-titulo: notices-algo != noticas/1
  has_many :comments
  belongs_to :user

end

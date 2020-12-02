class EthymonsController < ApplicationController

  def index
    @name = current_user.present? ? current_user.email : 'Desconocido'
  end

end

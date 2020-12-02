#Este controlador es totalmente independiente de notice Controller (del admin), tiene vistas por separado y todos los métodos no puedo
# acceder desde el otro lado!
class NoticesController < ApplicationController

  #Métodos de ver...

  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.friendly.find(params[:id])
    @coment = @notice.comments  #comentsrios de esta notica
    @comentario = Comment.new #agrega el formulario de comentarios directo en la págian del swho

  end

end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comments = Comment.new
  end

  def create
    @comment = Comment.new(comments_params)
    puts @comment
    if @comment.save
      flash[:notice] = "Registro Exitoso!"
      redirect_to notice_path(@comment.notice)
    else
      flash[:notice] = "Error el guardar..."
      redirect_to notice_path(@comment.notice)
    end

  end
  private
  def comments_params
    params.require(:comment).permit(:user_id, :notice_id, :comentarios)
  end

end

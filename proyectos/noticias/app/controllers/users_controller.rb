class UsersController < ApplicationController
  before_action :authenticate_user!

  #Cundo inicio sesión sesion me voy al home, pero de loegeado
  # En cada aplicación tengo una vista, y esa vista es el root
  # cuando inicio sesión.. me bota al... dashboard (un lugar inicial)
  def dashboard
    #current_user.notices todas las notiicas qu creó el usuario actual
    #current_user.comments todos los comentarios de ese usuario
    @notice = Notice.all
    @user = User.all
    #@notice_admin = User.all.select {|tipo| tipo.admin?}
    @users_admin = User.where(admin: true)
    @no_users_admin = User.where(admin: false)
    @noticias_uniqs = Comment.where(user_id: current_user.id).map(&:notice_id).uniq
    @coments = Comment.all
    @commets_x_notice = Comment.where(user_id: current_user.id).map(&:notice_id)
    @commts_user = Comment.where(user_id: current_user.id)


    @ultimo_comentario = Comment.where(user_id: current_user.id).last
    #@fecha_ultimo_comentario = Comment.where(user_id: current_user.id).last.updated_at
    #@noticia_ultimo_comentrio = Comment.where(user_id: current_user.id).last.notice_id

    #@user_final = User.last
    #@ultimo_comentario_usuario = @coments.where(user_id: @user_final.id)

  end


end

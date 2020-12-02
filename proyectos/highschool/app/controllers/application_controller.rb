class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def before_sign_in_path_for(resource)
    #current_user.is_a?(Admin) ? admin_tests_path : (stored_location_for(resource) || root_path)
    root_path
  end


  def after_sign_in_path_for(resource)
    #current_user.is_a?(Admin) ? admin_tests_path : (stored_location_for(resource) || root_path)
    dahsboard_path
  end


end

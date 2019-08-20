class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

  def sorted(object,col,direction)
    result = object.sort { |a,b| a[col.to_sym] <=> b[col.to_sym] }
    result = result.reverse if direction == 'DESC'
    result
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admins_path
    elsif resource.class == User
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :user
      root_path
    end
  end

end

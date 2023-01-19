class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    #Deviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッド
    def after_sign_in_path_for(resource)
      # user_path
      user_path(resource)
    end

    #サインアウト後にどこに遷移するかを設定するメソッド
    def after_sign_out_path_for(resource)
      root_path
    end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end

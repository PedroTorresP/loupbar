class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    include ApplicationHelper

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :first_name, :last_name, :postal_code])
        devise_parameter_sanitizer.permit(:account_update, keys: [:address, :first_name, :last_name, :postal_code])
    end

end

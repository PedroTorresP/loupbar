class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :update_ip
    before_action :block_ip_addresses
    include ApplicationHelper

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :first_name, :last_name, :postal_code, :city, :phone])
        devise_parameter_sanitizer.permit(:account_update, keys: [:address, :first_name, :last_name, :postal_code, :city, :phone])
    end

    def update_ip
        if current_user != nil
            current_user.ip = current_ip_address
            current_user.save
        end
    end
    
    def block_ip_addresses
        #head :unauthorized if current_ip_address == "XX.XX.XX.XX"
    end
  
    def current_ip_address
      request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
    end

end

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :flash_attack

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :name
    end

    def flash_attack
        flash[:notice] = "Bees?"
    end

 end
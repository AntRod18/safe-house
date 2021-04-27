class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception


    private 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end

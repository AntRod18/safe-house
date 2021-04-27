class SessionsController < ApplicationController
    def home

    end

    def new

    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path
        else
            flash[:message] = "Invalid Credentials"
            render :new
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end
end
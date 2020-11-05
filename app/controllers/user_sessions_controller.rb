class UserSessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])

        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            flash[:success] = "Signed in."
            redirect_to @user
        else
            flash.now[:error] = "Error signing in."
            render :new
        end
    end

    def destroy
        reset_session

        redirect_to login_path
    end
end

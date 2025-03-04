class SessionsController < ApplicationController

    def create 
        user = find_user
        session[:user_id] = user.id 
        render json: user
    end

    def destroy 
        session.delete :user_id 
        head :no_content
    end

    private

    def find_user
        User.find_by(username: params[:username])
    end
end

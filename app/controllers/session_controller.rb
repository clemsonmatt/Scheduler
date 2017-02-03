class SessionController < ApplicationController
    def new
    end

    def create
        user = Person.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to person_path(user)
        else
            flash.now.alert = 'Email or password is invalid'
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to new_session_path, notice: 'Logged out'
    end
end

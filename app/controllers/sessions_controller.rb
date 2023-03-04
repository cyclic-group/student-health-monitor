class SessionsController < ApplicationController
    skip_before_action :set_current_user, only: [:new, :create]

    def new 
    end

    def create
        pid = params[:session][:pid]
        password = params[:session][:password]
        @person = Person.find_by_id(pid)

        # Create a cookie session if the authenrication succeeds 
        if @person && @person.authenticate(password)
            session[:pid] = pid
            redirect_to student_home_path(pid)
        else  
            flash[:warning] = '密码错误'
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:pid)
        flash[:success] = '注销成功'
        redirect_to root_path 
    end
   
  
end

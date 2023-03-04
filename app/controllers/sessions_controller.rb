class SessionsController < ApplicationController
    def new 
    end

    def create
        # todo: authenticate user
        session[:sid] = params[:session][:sid]
        session[:password] = params[:session][:password]
        
        redirect_to student_home_path(sid)
    end

    def destroy
        session.delete(:sid)
        session.delete(:password)
        redirect_to root_path, notice: '注销成功'
    end
   
  
end

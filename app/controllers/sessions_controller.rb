class SessionsController < ApplicationController
    skip_before_action :set_current_user, only: [:new, :create]

    def new
    end

    def create
        @user_id = params[:session][:user_id]
        @user_password = params[:session][:user_password]
        user = User.find_by_id(@user_id)
        
        # 如果认证成功则创建cookie会话
        if user && user.authenticate(@user_password)
            session[:user_id] = @user_id
            redirect_to student_home_path(user_id)
        else  
            flash.now[:warning] = '密码错误'
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:success] = '注销成功'
        redirect_to root_path 
    end
   
  
end

class SessionsController < ApplicationController
    skip_before_action :set_current_user, only: [:new, :create]

    def new
    end

    def create
        @user_id = session_params[:user_id]
        @user_password = session_params[:user_password]
        user = User.find_by_id(@user_id)
        
        # 如果认证成功则创建cookie会话
        if user && user.authenticate(@user_password)
            session[:user_id] = @user_id
            if user.student? 
                redirect_to student_home_path
            elsif user.doctor? 
                redirect_to doctor_home_path
            else 
                flash.now[:warning] = '服务器故障'
                render :new, status: 500
            end
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
    
    private
    def session_params 
        params.require(:session).permit(:user_id, :user_password)
    end
  
end
